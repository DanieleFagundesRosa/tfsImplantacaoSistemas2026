# Lógica para estruturar os dados de métricas
class Metric:
    def __init__(self, service, status, response_time):
        self.service = service
        self.status = status
        self.response_time = response_time