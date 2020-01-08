# Luhn

Aujourd'hui, un sujet pour rèver un peu, toujours tiré de l'excellent site [Exercism.io](https://exercism.io/).  

En effet nous allons étudier et implémenter un algorithme utilisé pour valider des nombres aussi poétiques qu'un numéro 
de Siret ou de carte bleue ou encore l'IMEI de votre carte SIM !  

Votre mission, si vous l'acceptez, sera de vérifier si un nombre donné (sous forme de chaîne de caractères) vérifie ou 
non la [formule de Luhn](https://fr.wikipedia.org/wiki/Formule_de_Luhn).  

Bon, maintenant qu'on a fait les présentations, regardons un peu comment cet algo fonctionne:  

Validation d'un nombre
-----
D'abord, les chaînes de longueur inférieure ou égale à 1 ne sont pas valides. Les espaces sont autorisés, mais devront 
être éliminés avant la vérification proprement dite. Tout autre caractère, hormis les chiffres et l'espace, sont interdits.

## Exemple 1: nombre de carte de crédit valide

```text
4539 1488 0343 6467
```

On va modifier tous "deuxièmes" chiffres en partant de la droite. Ci-dessous, on a remplacé tous les chiffres qui ne vont
 pas être modifiés par un tiret bas, juste pour bien faire apparaître les chiffres qu'on va doubler, AVANT de les doubler.

```text
4_3_ 1_8_ 0_4_ 6_6_
```

La première étape de l'algorithme de Luhn est de doubler chaque deuxième chiffre, en partant de la fin du nombre à droite.
Ici le dernier chiffre, à droite est 7. On n'y touche pas. On avance d'un cran vers la gauche et on double ce chiffre, 
ici 6. Si le chiffre doublé dépasse 9, on le remplace par la somme des ses chiffres. C'est le cas ici, car 2 x 6 donne 12, 
donc on remplace 6 par `1 + 2 `, soit `3`. Ce qui équivaut aussi à retrancher 9 du chiffre doublé: 2 x 6 = 12, et 12 - 9 
donne bien `3`

Et après le doublement cela donne, toujours en masquant les chiffres n'étant pas modifiés:
```text
8_6_ 2_7_ 0_8_ 3_3_
```

En remettant les chiffres non doublés, on obtient donc:
```text
8569 2478 0383 3437
```

Ensuite on fait la somme de tous les chiffres:

```text
8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
```

Si cette somme est divisible par 10, alors le nombre est valide.  
Donc, ici, notre nombre, 8569 2478 0383 3437, est valide!

## Exemple 2: nombre de carte de crédit invalide

```text
8273 1232 7352 0569
```

On double les seconds chiffres, en partant de la droite, ce qui donne :

```text
7253 2262 5312 0539
```

On somme tous les chiffres:

```text
7+2+5+3+2+2+6+2+5+3+1+2+0+5+3+9 = 57
```

57 n'est pas divisible par 10, donc ce nombre n'est pas valide.

* * * *

Pour l'installation de la gem minitest, nécessaire pour lancer les tests, il faut exécuter dans votre terminal:

    gem install minitest
   
Pour lancer les tests, depuis le dossier où sont vos fichiers:

    ruby luhn_test.rb

Pour avoir une sortie en couleur, soit vous copiez cette ligne dans le fichier test

    require 'minitest/pride'
 
 soit vous lancez vos tests ainsi, depuis la ligne de commande:

    ruby -r minitest/pride luhn_test.rb



Pour nos amis anglophones/For the english speakers:  

Given a number determine whether or not it is valid per the Luhn formula.

The [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) is
a simple checksum formula used to validate a variety of identification
numbers, such as credit card numbers and Canadian Social Insurance
Numbers.

The task is to check if a given string is valid.

Validating a Number
------

Strings of length 1 or less are not valid. Spaces are allowed in the input,
but they should be stripped before checking. All other non-digit characters
are disallowed.

## Example 1: valid credit card number

```text
4539 1488 0343 6467
```

The first step of the Luhn algorithm is to double every second digit,
starting from the right. We will be doubling

```text
4_3_ 1_8_ 0_4_ 6_6_
```

If doubling the number results in a number greater than 9 then subtract 9
from the product. The results of our doubling:

```text
8569 2478 0383 3437
```

Then sum all of the digits:

```text
8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
```

If the sum is evenly divisible by 10, then the number is valid. This number is valid!

## Example 2: invalid credit card number

```text
8273 1232 7352 0569
```

Double the second digits, starting from the right

```text
7253 2262 5312 0539
```

Sum the digits

```text
7+2+5+3+2+2+6+2+5+3+1+2+0+5+3+9 = 57
```

57 is not evenly divisible by 10, so this number is not valid.

* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby luhn_test.rb

To include color from the command line:

    ruby -r minitest/pride luhn_test.rb


## Source

The Luhn Algorithm on Wikipedia [http://en.wikipedia.org/wiki/Luhn_algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm)
