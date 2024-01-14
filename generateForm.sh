#!/bin/bash
# Programa para creación de formulario en angular , te genera una base de form , para utilizar y avanzar más rápido
#Autor:ALex:D - @soygeekgirl- V0.0.1 -@alexandrajimenezc - https://www.linkedin.com/in/alexandra-jimenez-4b6459167/

option=0
options=("Crear Form con Inputs y selects", "Salir")
while :
do
    clear
    echo "-------------------------------------------"
    echo "------ ╔═════════════════════════╗ --------"
    echo "------ ║ Generador de forms en   ║ --------"
    echo "------ ║  angular  por Alex!! ♥  ║  --------"
    echo "------ ║      @soygeekgirl       ║  --------"
    echo "------ ╚═════════════════════════╝ --------"
    echo "-------------------------------------------"
    echo "            MENÚ PRINCIPAL                 "
    echo "-------------------------------------------"
    for ((i=0; i < ${#options[*]}; i++))
    do
        echo -e "\n $((i+1)).${options[$i]}"
    done
    echo "-------------------------------------------"
    # get option
    read -n1 -p "Ingrese una opción [1-2]: " option
    
    case $option in
        1)
echo " "
echo "A continuación ingresa los nombres de input "
echo "o select según te vaya preguntado separado por coma , "
echo "por ej inputs: nombre,apellido,edad "
echo "por ej selects: genero,option "
echo "-------Recuerda salir con la opción 2, al volver al menu-----"
echo " "

read -p "Ingrese nombres de inputs (separado por coma): " inputNames
inputNamesArray=($(echo $inputNames | tr ',' '\n'))
read -p "Ingrese nombres de selects (separado por coma): " selectNames
selectNamesArray=($(echo $selectNames | tr ',' '\n'))
# Generate the placeholder.ts file
touch placeholder.ts

# Write template to the placeholder.ts file
echo "import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-placeholder',
  templateUrl: './placeholder.component.html',
  styleUrls: ['./placeholder.component.css']
})
export class PlaceholderComponent implements OnInit {

  constructor(private _fb: FormBuilder) {}

  public form: FormGroup;

  ngOnInit() {
    this.form = this._fb.group({
" > placeholder.ts

# Loop through the input names and add them to the form group
for inputName in "${inputNamesArray[@]}"; do
  echo "    $inputName: ['', [Validators.required]]," >> placeholder.ts
done
>> placeholder.ts


# Loop through the selects names and add them to the form group
for selectName in "${selectNamesArray[@]}"; do
  echo "    $selectName: [null, [Validators.required]]," >> placeholder.ts
done

# Complete the placeholder.ts file
echo "  });
  }
}" >> placeholder.ts


            
      touch placeholder.html

# Write the HTML template to the placeholder.html file
echo "<h1>Formulario de prueba</h1> 
<form [formGroup]=\"form\">" > placeholder.html

# Loop through the input names and add text inputs to the form
for inputName in "${inputNamesArray[@]}"; do
  echo "  <div>
    <label for=\"$inputName\">$inputName:</label>
    <input type=\"text\" formControlName=\"$inputName\" placeholder=\"$inputName\">
  </div>" >> placeholder.html
done

# Loop through the select names and add select to the form
for selectName in "${selectNamesArray[@]}"; do
  echo "  <div>
    <label for=\"$selectName\">$selectName:</label>
    <select formControlName=\"$selectName\">
      <option value=\"\">Titulo</option>
      <option value=\"option1\">Option1</option>
      <option value=\"option2\">Option2</option>
    </select>
  </div>" >> placeholder.html
done

echo "           
  <button type=\"submit\">Enviar</button>
</form>
" >> placeholder.html

  echo -e "\n  Se generara un fichero placeholder.ts"
  echo -e "\n  Se generara un fichero placeholder.html"
            
            sleep 2
        ;;
        2)
            echo -e "\nBYE-BYE"
            exit 0
        ;;
    esac
done