class Corsa {

  const color

  method capacidad() {
    return 4 
  }

  method velocidadMaxima() {
    return 150
  }

  method color() {
    return color
  }

  method peso() {
    return 1300
  }
 

}

class RenaultKwid {

  var tieneTanqueAdicional = true

  method capacidad() {
    if (not tieneTanqueAdicional) {
      return 4
    }
    else {
      return 3
    }
  }

  method velocidadMaxima() {
    if (tieneTanqueAdicional) {
      return 120
    }
    else {
      return 110
    }
    
  }

  method peso() {
    if (tieneTanqueAdicional) {
      return 1200 + 150 
    }
    else {
      return 1200
    }
  }

  method color() {
    return "Azul"
  }

  method ponerTanqueAdicional() {
    tieneTanqueAdicional = true
  }

  method sacarTanqueAdicional() {
    tieneTanqueAdicional = false
  }

}

object trafic {

  var interiorActual = popular
  var motorActual = bataton

  method capacidad() {
    return interiorActual.capacidad()
  }

  method velocidadMaxima() {
    return motorActual.velocidadMaxima()
  }

  method peso() {
    return 4000 + interiorActual.peso() + motorActual.peso()
  }

  method color() {
    return "blanco"
  }

  method cambiarMotorABataton() {
    motorActual = bataton
  }

  method cambiarMotorAPulenta() {
    motorActual = pulenta
  }

  method cambiarInteriorAPopular() {
    interiorActual = popular
  }

  method cambiarInteriorAComodo() {
    interiorActual = comodo
  }

}

object comodo {

  method capacidad() {
    return 5
  }

  method peso() {
    return 700
  }

}

object popular {

  method capacidad() {
    return 12
  }

  method peso() {
    return 1000
  }

}

object pulenta {

  method peso() {
    return 800
  }

  method velocidadMaxima() {
    return 130
  }

}

object bataton {

  method peso() {
    return 500
  }

  method velocidadMaxima() {
    return 80
  }

}


class AutosEspeciales {

  const capacidad 
  const velocidadMaxima
  const peso
  const color

  method capacidad() {
    return capacidad
  }

  method velocidadMaxima() {
    return velocidadMaxima
  }

  method peso() {
    return peso
  }

  method color() {
    return color
  }

}

class Dependencia {

  const flotaDeRodados = []
  const pedidos = []
  const cantidadDeEmpleados

  method cantidadDeEmpleados() {
    return cantidadDeEmpleados
  }

  method agregarAFlota(rodado) {
    flotaDeRodados.add(rodado)
  }

  method quitarDeLaFlota(rodado) {
    flotaDeRodados.remove(rodado)
  }

  method pesoTotalFlota() {
    return flotaDeRodados.sum({r => r.peso()})
  }

  method cantidadDeRodados() {
    return flotaDeRodados.size()
  }

  method estaBienEquipada() {
    return self.cantidadDeRodados() >= 3 and flotaDeRodados.all({r => r.velocidadMaxima() >= 100 })
  }

  method rodadosDeColor(color) {
    return flotaDeRodados.filter({r => r.color() == color })
  }

  method capacidadTotalEnColor(color) {
    return self.rodadosDeColor(color).sum({r => r.capacidad()})  //fijarse si la suma da 0
  }

  method rodadoMasRapido() {
    return flotaDeRodados.max({r => r.velocidadMaxima()})
  }

  method colorDelRodadoMasRapido() {
    return self.rodadoMasRapido().color()
  }

  method capacidadDeTodosLosVehiculosDeLaFlota() {
    return flotaDeRodados.sum({r => r.capacidad()})
  }

  method capacidadFaltante() {
    return self.cantidadDeEmpleados() - self.capacidadDeTodosLosVehiculosDeLaFlota()
  }

  method esGrande() {
    return self.cantidadDeEmpleados() >= 40 and self.cantidadDeRodados() >= 5
  }

  method agregarPedido(pedido) {
    pedidos.add(pedido)
  }

  method quitarPedido(pedido) {
    pedidos.remove(pedido)
  }

  method totalDePasajerosEnPedidos() {
    return pedidos.sum({p => p.cantidadDePasajerosATransportar()})
  }

  method pedidosRegistrados() {
    return pedidos
  }

  method noPuedeSerSatisfecho() {
    return //ver
  }

  method esColorIncompatible(color) {
    return pedidos.all({p => p.coloresIncompatibles() == color})
  }

  method relajarTodosLosPedidos() {
    pedidos.forEach({p => p.relajar()})
  }

}

class Pedidos {

  const distanciaARecorrer
  var tiempoMaximoDeViaje
  const cantidadDePasajerosATransportar
  const coloresInconpatibles = #{}

  method distanciaARecorrer() {
    return distanciaARecorrer
  }

  method tiempoMaximoDeViaje() {
    return tiempoMaximoDeViaje
  }

  method cantidadDePasajerosATransportar() {
    return cantidadDePasajerosATransportar
  }

  method coloresIncompatibles() {
    return coloresInconpatibles
  }

  method velocidadRequerida() {
    return distanciaARecorrer / tiempoMaximoDeViaje
  }

  method puedeSatifacerPedido(auto) {
    return auto.velocidadMaxima() >= self.velocidadRequerida() and auto.capacidad() == cantidadDePasajerosATransportar and auto.color() != coloresInconpatibles //jugar con min para que haya un tope de pasajeros y max para que haya un minimo
  }

  method acelerar() {
    tiempoMaximoDeViaje = tiempoMaximoDeViaje - 1
  }

  method relajar() {
    tiempoMaximoDeViaje = tiempoMaximoDeViaje + 1
  }

}

