



sem mutex = 1;

Process Persona[id: 0..N-1] {
    { 
      P(mutex)
      // se usa detector
      V(mutex)
    }
}

Process Detector {
    
}