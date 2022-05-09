# Herramienta DNSPerft dockerizada

## Documentacion

Herramienta basada en https://github.com/DNS-OARC/dnsperf

## Ejecucion

Descargar y correr imagen desde docker hub:
```bash
docker run --rm --name dnsperf drxmknight/dnsperf -h
```

Para montar el volumen con el archivo de pruebas:
```bash
docker run --rm --name dnsperf -v -v ${PWD}/test/:/test:ro drxmknight/dnsperf -h
```

## Test

El siguiente comando ejecuta 100 veces la prueba de rendimiento sobre el servidor 8.8.8.8:
```bash
docker run --rm --name dnsperf -v ${PWD}/test:/test:ro drxmknight/dnsperf -s 8.8.8.8 -d /test/google.test -v -n 100
```

## Salida
Al finalizar, deberia mostrar resultados como los siguientes:
```txt
[Status] Testing complete (end of file)

Statistics:

  Queries sent:         300
  Queries completed:    300 (100.00%)
  Queries lost:         0 (0.00%)

  Response codes:       NOERROR 300 (100.00%)
  Average packet size:  request 30, response 180
  Run time (s):         0.372813
  Queries per second:   804.692969

  Average Latency (s):  0.108083 (min 0.006061, max 0.206920)
  Latency StdDev (s):   0.046340
```
