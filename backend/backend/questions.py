data = [
   {
      "q":"Have you experienced one or more flooding events in your life ?",
      "yes":2,
      "no":1,
   },
   {
      "q":"Do You feel well prepared to face a flooding event ?",
      "yes":4,
      "no":3,
   },
   {
      "q":"Has your municipality prepared an emergency plan ? ",
      "yes":6,
      "no":5,
   },
   {
      "q":"Do you live near the river ? ",
      "yes":8,
      "no":7,
   },
   {
      "q":"In your opinion what is the flood risk area where you live ?",
      "yes":10,
      "no":9,
   },
   {
      "a":"Moderate Risk"
   },
   {
      "a":"Low risk"
   },
   {
      "a":"Minimal Risk"
   },
   {
      "q":"In your opinion what is the flood risk area where you live ? ",
      "yes":12,
      "no":11,
   },
   {
      "a":"Minimal Risk"
   },
   {
      "a":"Moderate Risk"
   },
   {
      "a":" Moderate Risk"
   },
   {
      "a":"High Risk"
   },
]

class nody:
   def srch(value=0, choice="null"):
      nod = data[value]
      nextnod = nod
      if choice == 'yes':
         value = nod.get('yes')
         nextnod= data[value]
      elif choice == 'no':
         value =nod.get('no')
         nextnod= data[value]

      return nextnod.get('q', nextnod.get('a')), value


# first case
# q, index = nody.srch()
# print(q, index)

# # if response:
# a = nody.srch(2,"yes")
# print(a)

def nextquestion(request):
    print("jack was Here !")
    value = request.GET.get("index")
    choice = request.GET.get("index")
    q, value = nody().srch(value, choice)
    return value, q