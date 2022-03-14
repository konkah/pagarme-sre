from datetime import datetime
from random import random
from time import sleep, time
from django.http import JsonResponse

def index(request):
	seconds = time() % 1
	sleep(seconds)

	headers = {}
	for key in request.headers.keys():
		headers[key] = request.headers[key]

	json = {
		"seconds": seconds,
		"hash": hash(request),
		"datetime": datetime.now(),
		"headers": headers,
	}
	return JsonResponse(json)
