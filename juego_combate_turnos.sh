#!/bin/bash

# Definición de variables de puntos de vida, concentración, objetos y estados 

HP_jugador=100
HP_enemigo=100
PC_jugador=10
sacrificio=1

t_mala=5
viales=3
t_buena=1
Pociones=5
ibuprofeno=2
bombas=3

miedo_enemigo=0
conversacion=0
humor=0
aceite=0
provocacion=1


  # Acción de habilidades

    habilidades() {
        echo ""
        echo "pc = $PC_jugador 🔵"
        echo ""
        echo "1. Beneficio arriesgado 🩸  (-20 pc, -20 hp)"
        echo ""
        echo "2. Embestida del Cantábrico ❄️  (-30 pc)"
        echo ""
        echo "3. Puñalada del siglo XIX 🗡️  (-40 pc)"
        echo ""
        echo "4. Conjuro letal ☠️  (Habilidad definitiva), (-80 pc)"
        echo ""
        read -p "Elige una habilidad (1-4): " habilidad

        if [[ $habilidad -gt 4 ]] && [[ $habilidad -lt 0 ]]; then
            clear
            echo ""
            echo "Acción invalidada, turno perdido "
            sleep 3
            clear
        
        elif [[ $habilidad == 1 ]] && [[ $PC_jugador -ge 20 ]]; then
            HP_jugador=$(( HP_jugador - 20 ))
            PC_jugador=$(( PC_jugador - 20 ))
            sacrificio=$(( sacrificio + 1 ))
            clear
            echo ""
            echo "Sacrificas una parte de tu salud para fortalezer tu fuerza de ataque"
            sleep 3
            echo "Te inflinges 20 puntos de daño"
            sleep 3
            echo "Has gastado 20 puntos de concentración por el uso de la habilidad"
            sleep 3
            clear

        elif [[ $habilidad == 1 ]] && [[ $PC_jugador -lt 20 ]]; then
            clear
            echo ""
            echo "Acción invalidada por puntos de concentración insuficientes, turno perdido"
            sleep 4
            clear
    
        elif [[ $habilidad == 2 ]] && [[ $PC_jugador -ge 30 ]]; then
            damage_habilidad2=$(( RANDOM % 35 + 10 ))
            damage_final2=$(( $damage_habilidad2 * $sacrificio))
            HP_enemigo=$(( HP_enemigo - $damage_final2 ))
            PC_jugador=$(( PC_jugador - 30 ))
            clear
            echo ""
            echo "Invocas una helada ola del Cantábrico hacia tu enemigo "
            sleep 3
            echo "Inflinges a tu enemigo $damage_final2 puntos de daño "
            sleep 3
            echo "Has gastado 30 puntos de concentración por el uso de la habilidad"
            sleep 3
            clear
    
        elif [[ $habilidad == 2 ]] && [[ $PC_jugador -lt 30 ]]; then
            clear
            echo ""
            echo "Acción invalidada por puntos de concentración insuficientes, turno perdido"
            sleep 4
            clear

    
        elif [[ $habilidad == 3 ]] && [[ $PC_jugador -ge 40 ]]; then
            damage_habilidad3=$(( RANDOM % 45 + 10 ))
            damage_final3=$(( $damage_habilidad3 * $sacrificio))
            HP_enemigo=$(( HP_enemigo - $damage_final3 ))
            PC_jugador=$(( PC_jugador - 40 ))
            clear
            echo ""
            echo "Asestas una puñalada a tu enemigo con una navaja albaceteña del siglo XIX"
            sleep 4
            echo "Inflinges a tu enemigo $damage_final3 puntos de daño "
            sleep 3
            echo "Has gastado 25 puntos de concentración por el uso de la habilidad"
            sleep 3
            clear

        elif [[ $habilidad == 3 ]] && [[ $PC_jugador -lt 40 ]]; then
            clear
            echo ""
            echo "Acción invalidada por puntos de concentración insuficientes, turno perdido"
            sleep 5
            clear

        elif [[ $habilidad == 4 ]] && [[ $PC_jugador -ge 80 ]]; then
            damage=$(( RANDOM % 500 + 200 ))
            HP_enemigo=$(( HP_enemigo - $damage ))
            PC_jugador=$(( PC_jugador - 80 ))
            clear
            echo ""
            echo "Recitas unas oraciones para invocar un conjuro mortal que acabrá con la vida del enemigo inmediatamente"
            sleep 5
            echo "আমি মৃত্যুমন্ত্রের শব্দগুলো আবৃত্তি করি"
            sleep 3
            echo "এই পৃথিবী থেকে অদৃশ্য!!"
            sleep 3
            echo "De repente, la cabeza del enemigo estalla en mil pedazos"
            sleep 3
            echo "Inflinges a tu enemigo $damage puntos de daño"
            sleep 3
            echo "Has gastado 80 puntos de concentración por el uso de la habilidad"
            clear

        elif [[ $habilidad == 4 ]] && [[ $PC_jugador -lt 80 ]]; then
            clear
            echo ""
            echo "Acción invalidada por puntos de concentración insuficientes, turno perdido"
            sleep 5
            clear

        else
            clear
            echo ""
            echo "Acción invalidada, turno perdido"
            sleep 3
            clear

        fi
    }

    # Acción de objetos

    objetos() {
        echo ""
        echo "1. Tortilla de patatas (Mala) 👎  tienes $t_mala"
        echo ""
        echo "2. ibuprofeno 💊  tienes $ibuprofeno"
        echo ""
        echo "3. Vial de aceite de Toledo 🍾  tienes $viales"
        echo ""
        echo "4. Tortilla de patatas (Buena) ⭐  tienes $t_buena"
        echo ""
        echo "5. Poción inútil 🍷  tienes $Pociones"
        echo ""
        echo "6. bomba incendiaria 🔥  tienes $bombas"
        echo ""
        read -p "Elige un objeto consumible (1-6): " objeto

       if [[ $objeto == 1 ]] && [[ $t_mala -gt 0 ]]; then
            t_mala=$(( t_mala - 1 ))
            HP_jugador=$(( HP_jugador + 20 ))
            clear
            echo ""
            echo "te comes una tortilla de patatas insípida y hecha con huevina"
            sleep 3
            echo "no es de las mejores tortillas que has comido, pero regeneras en 20 puntos tu salud"
            sleep 5
            clear

        elif [[ $objeto == 1 ]] && [[ $t_mala = 0 ]]; then
            clear
            echo ""
            echo "no te quedan más tortillas malas, turno perdido"
            sleep 3
            clear
       
       
        elif [[ $objeto == 2 ]] && [[ $ibuprofeno -gt 0 ]]; then
            ibuprofeno=$(( ibuprofeno - 1 ))
            PC_jugador=$(( PC_jugador + 30 ))
            clear
            echo ""
            echo "te tomas un ibuprofeno"
            sleep 3
            echo "al aliviar tu dolor de cabeza, consigues 30 puntos de concentración"
            sleep 3
            clear


        elif [[ $objeto == 2 ]] && [[ $ibuprofeno = 0 ]]; then
            clear
            echo ""
            echo "No te queda más ibuprofeno, turno perdido"
            sleep 3
            clear
       

        elif [[ $objeto == 3 ]] && [[ $viales -gt 0 ]]; then
            viales=$(( viales - 1 ))
            aceite=$(( aceite + 1 ))
            clear
            echo ""
            echo "Lanzas un vial de aceite al enemigo y lo engrasas completamente"
            sleep 3
            echo "Ahora es más vulnerable al fuego"
            sleep 3
            clear

        elif [[ $objeto == 3 ]] && [[ $viales = 0 ]]; then
            clear
            echo ""
            echo "No te quedan más viales de aceite, turno perdido"
            sleep 3
            clear

        
        elif [[ $objeto == 4 ]] && [[ $t_buena -gt 0 ]]; then
            t_buena=$(( t_buena - 1 ))
            HP_jugador=$(( HP_jugador + 75 ))
            clear
            echo ""
            echo "te comes una tortilla de patatas de verdad con cebolla y poco hecha"
            sleep 3
            echo "Está tan buena que recuperas 75 puntos de salud"
            sleep 3
            clear

        elif [[ $objeto == 4 ]] && [[ $t_buena = 0 ]]; then
            clear
            echo ""
            echo "no tienes más tortillas, turno perdido"
            sleep 3
            clear

        elif [[ $objeto == 5 ]] && [[ $Pociones -gt 0 ]]; then
            Pociones=$(( Pociones - 1 ))
            clear
            echo ""
            echo "te bebes la poción inútil"
            sleep 3
            echo "No pasa absolutamente nada"
            sleep 3
            clear

        elif [[ $objeto == 5 ]] && [[ $Pociones = 0 ]]; then
            clear
            echo ""
            echo "No te quedan más pociones inútiles, pero la realidad es que..." 
            sleep 3
            echo "tener estas pociones es lo mismo que no tener ninguna"
            sleep 3
            clear

        elif [[ $objeto == 6 ]] && [[ $bombas -gt 0 ]] && [[ $aceite = 0 ]]; then
            bombas=$(( bombas - 1 ))
            HP_enemigo=$(( HP_enemigo - 15 ))
            clear
            echo ""
            echo "Lanzas una bomba incendiaria al enemigo"
            sleep 3
            echo "Le inflinges 15 puntos de daño"
            sleep 3
            clear
        
        elif [[ $objeto == 6 ]] && [[ $bombas -gt 0 ]] && [[ $aceite = 1 ]]; then
            bombas=$(( bombas - 1 ))
            HP_enemigo=$(( HP_enemigo - 40 ))
            aceite=$(( aceite - 1 ))
            clear
            echo ""
            echo "Lanzas una bomba incendiaria al enemigo"
            sleep 3
            echo "El enemigo al estar impregnado de aceite, el fuego de la bomba le afecta bastante, inflingiéndole 40 puntos de daño"
            sleep 6
            echo "El enemigo deja de estar impregnado de aceite"
            sleep 3
            clear

        elif [[ $objeto == 6 ]] && [[ $bombas = 0 ]]; then
            clear
            echo ""
            echo "No te quedan más bombas incendiarias, turno perdido" 
            sleep 3
            clear

        else
            clear
            echo ""
            echo "Acción invalidada, turno perdido "
            sleep 3
            clear
        fi
    
    }

      # Acción de ataque básico

    ataque() {

        if [[ $accion == 1 ]]; then
        damage_jugador=$(( RANDOM % 15 + 5 ))
        PC_jugador=$(( PC_jugador + 15 ))
        damage_final_jugador=$(( $damage_jugador * $sacrificio))
        HP_enemigo=$(( HP_enemigo - $damage_final_jugador ))
        clear
        echo ""
        echo "Atacas al enemigo"
        sleep 3
        echo "le has inflingido $damage_final_jugador puntos de daño"
        sleep 3
        echo "has ganado 15 puntos de concentración"
        sleep 3
        clear
        fi
        
    }

      # Acción de interactuar con el enemigo

    interactuar(){
        echo ""
        echo "1. Hablar 🗣️"
        echo ""
        echo "2. Chiste 🤣"
        echo ""
        echo "3. Intimidar 😥"
        echo ""
        echo "4. Provocar 😡"
        echo ""
        read -p "Elige una opción para interactuar con el enemigo (1-4): " interaccion
        
        if [[ $interaccion == 1 ]] && [[ $conversacion = 0 ]]; then
            conversacion=$(( $conversacion + 1 ))
            clear
            echo ""
            echo "Intentas hablar con el enemigo para intentar solucionar el conflicto pacíficamente"
            sleep 5
            echo "El enemigo tiene tantas ganas de matarte que es imposible razonar con él "
            sleep 5
            clear

        elif [[ $interaccion == 1 ]] && [[ $conversacion = 1 ]]; then
            clear
            echo ""
            echo "Parece que Hablar no resolverá el conflicto. Prueba otra cosa"
            sleep 5
            clear
        
        elif [[ $interaccion == 2 ]] && [[ $humor = 0 ]]; then
            humor=$(( $humor + 1 ))
            clear
            echo ""
            echo "Le cuentas a tu enemigo el chiste de Jara (el mejor del mundo)"
            sleep 4
            echo "El enemigo hace como si no hubiera escuchado nada"
            sleep 5

        elif [[ $interaccion == 2 ]] && [[ $humor = 1 ]]; then
            clear
            echo ""
            echo "Parece que al enemigo no le hace gracia ningún chiste, prueba otra cosa"
            sleep 5
            clear

        elif [[ $interaccion == 3 ]] && [[ $miedo_enemigo = 0 ]]; then
            miedo_enemigo=$(( $miedo_enemigo + 1 ))
            clear
            echo ""
            echo "Le dices a tu enemigo que enfrentarse a ti fue el mayor error que ha cometido en su miserable vida"
            sleep 6
            echo "El enemigo pone cara de preocupación"
            sleep 5
            clear
        
        elif [[ $interaccion == 3 ]] && [[ $miedo_enemigo -eq 1 ]]; then
            miedo_enemigo=$(( $miedo_enemigo + 1 ))
            clear
            echo ""
            echo "le dices a tu enemigo que tienes un espacio vacío en tu pared con su forma exacta"
            sleep 6
            echo "El enemigo empieza a temblar y empieza a pensar si seguir con el combate o no"
            sleep 5
            clear
            
        elif [[ $interaccion == 3 ]] && [[ $miedo_enemigo -eq 2 ]]; then
            clear
            echo ""
            echo "Pones cara de psicópata y le dices a tu enemigo que después de matarle y usar sus costillas como xilófono ira también a por toda su familia "
            sleep 8
            echo "El enemigo definitivamente teme las terribles consecuencias de enfrentarse a ti y huye corriendo como pollo sin cabeza, ganando tú el combate 🥳🥳"
            sleep 6
            clear
                   
        cat <<'EOF'

    ================================================================
     ___     ___      _             _       _       _   _           
    (_) \   / (_) ___| |_ ___  _ __(_) __ _| |     | | | | __ _ ___ 
    | |\ \ / /| |/ __| __/ _ \| '__| |/ _` | |     | |_| |/ _` / __|
    | | \ V / | | (__| || (_) | |  | | (_| |_|  _  |  _  | (_| \__ \
    |_|__\_/  |_|\___|\__\___/|_|_ |_|\__,_(_) ( ) |_| |_|\__,_|___/
    / ___| __ _ _ __   __ _  __| | ___        |/                   
    | |  _ / _` | '_ \ / _` |/ _` |/ _ \                            
    | |_| | (_| | | | | (_| | (_| | (_) |                           
     \____|\__,_|_| |_|\__,_|\__,_|\___/               

    ================================================================
      
    -hrr-
EOF
            sleep 2
            echo "y eso que iba de machote"
            sleep 2
            exit 0
        
        
        elif [[ $interaccion == 4 ]] && [[ $provocacion = 1 ]]; then
            provocacion=$(( $provocacion + 1 ))
            clear
            echo ""
            echo "Le dices a tu enemigo que es más inútil que las pociones que llevas en tu inventario"
            sleep 5
            echo "Parece que al enemigo no le ha gustado eso"
            sleep 3
            echo "El daño del enemigo se duplica"
            sleep 3
            clear
        
        elif [[ $interaccion == 4 ]] && [[ $provocacion = 2 ]]; then
            provocacion=$(( $provocacion + 2 ))
            clear
            echo ""
            echo "Le dices a tu enemigo que si la inteligencia fuese dinero, él sería la crisis del 2008"
            sleep 5
            echo "Parece que al enemigo no le ha gustado eso"
            sleep 3
            echo "El daño del enemigo se duplica todavía más"
            sleep 3
            clear

        elif [[ $interaccion == 4 ]] && [[ $provocacion = 4 ]]; then
            clear
            echo ""
            echo "Si sigues provocando, el enemigo te va a poner mirando a Cuenca de un golpe, mejor prueba otra cosa"
            sleep 6
            clear
        
        else
            clear
            echo ""
            echo "Acción invalidada, turno perdido "
            sleep 3
            clear
        fi
    
    }

      # Acción de capitulación

    rendicion() {
         
        if [[ $accion == 5 ]]; then
        clear
        echo ""
        echo "Te rindes ante la superioridad de tu enemigo 🏳️, pierdes el combate 😞  "
        sleep 3

    cat <<'EOF'
    
    =====================================================
     _   _                                _ _     _       
    | | | | __ _ ___   _ __   ___ _ __ __| (_) __| | ___  
    | |_| |/ _` / __| | '_ \ / _ \ '__/ _` | |/ _` |/ _ \ 
    |  _  | (_| \__ \ | |_) |  __/ | | (_| | | (_| | (_) |
    |_| |_|\__,_|___/ | .__/ \___|_|  \__,_|_|\__,_|\___/ 
                      |_|                                 
    
    =====================================================
    -hrr-

EOF
        sleep 2
        echo "No te rindas, Podías haber ganado!"
        sleep 2
        exit 0
        fi

    }

    # Mensaje de inicio

clear
echo ""
    echo "Empieza el duelo..."
    sleep 4
    clear


    # Turno del jugador

while [[ $HP_jugador -gt 0 ]] || [[ $HP_enemigo -gt 0 ]]; do
    echo ""
    echo "======== Es tu turno ========"
    echo "hp: $HP_jugador 🔴"
    echo "pc: $PC_jugador 🔵" 
    echo "hp_enemigo: $HP_enemigo 💀🔴"
    echo ""
    echo "1. Ataque básico ⚔️"
    echo "2. Habilidades 🤺"
    echo "3. Objetos 💰"
    echo "4. Interactuar 🗣️"
    echo "5. Rendirse 🏳️"
    echo ""
    read -p "Elige una acción (1-5): " accion

    # menú de botones

    case $accion in 

        1)
        ataque
        ;;

        2)
        habilidades
        ;;

        3)
        objetos
        ;;

        4)
        interactuar
        ;;

        5)
        rendicion
        ;;

        *)
        echo "Acción invalidada, turno perdido"
        ;;

    esac

    # Acción de victoria
    
    if [[ $HP_enemigo -le 0 ]]; then
        echo ""
        echo "El enemigo cae derrotado y ganas el combate 🥳🥳 "
        sleep 4

    cat <<'EOF'

    ================================================================
     ___     ___      _             _       _       _   _           
    (_) \   / (_) ___| |_ ___  _ __(_) __ _| |     | | | | __ _ ___ 
    | |\ \ / /| |/ __| __/ _ \| '__| |/ _` | |     | |_| |/ _` / __|
    | | \ V / | | (__| || (_) | |  | | (_| |_|  _  |  _  | (_| \__ \
    |_|__\_/  |_|\___|\__\___/|_|_ |_|\__,_(_) ( ) |_| |_|\__,_|___/
    / ___| __ _ _ __   __ _  __| | ___        |/                   
    | |  _ / _` | '_ \ / _` |/ _` |/ _ \                            
    | |_| | (_| | | | | (_| | (_| | (_) |                           
     \____|\__,_|_| |_|\__,_|\__,_|\___/               

    ================================================================
    
    -hrr-
EOF
    exit 0
    fi

 # Turno del enemigo

    if [[ $HP_enemigo -gt 0 ]]; then
        echo ""
        sleep 3
        echo "======== Turno del enemigo ========"
        damage_enemigo=$(( RANDOM % 10 + 7 ))
        damage_final=$(( $damage_enemigo * $provocacion))
        HP_jugador=$((HP_jugador - $damage_final))
        sleep 3
        echo "El enemigo te ataca"
        sleep 3
        echo "Te inflinge $damage_final puntos de daño"
        sleep 3
        clear
        
    fi


    # Acción de derrota

    if [[ $HP_jugador -le 0 ]]; then
        echo "Caes derrotado ante tu enemigo 😵 , pierdes el combate 😞 "
        sleep 3

    cat <<'EOF'

    =====================================================
     _   _                                _ _     _       
    | | | | __ _ ___   _ __   ___ _ __ __| (_) __| | ___  
    | |_| |/ _` / __| | '_ \ / _ \ '__/ _` | |/ _` |/ _ \ 
    |  _  | (_| \__ \ | |_) |  __/ | | (_| | | (_| | (_) |
    |_| |_|\__,_|___/ | .__/ \___|_|  \__,_|_|\__,_|\___/ 
                      |_|                                 
    
    =====================================================
    -hrr-

EOF
    sleep 2
    echo "La mala noticia es que has muerto, La buena noticia es que los gusanos cenarán esta noche"
    sleep 5
    exit 0
    fi

    if [[ $HP_enemigo -lt 10 ]]; then
        echo "El enemigo tiene la salud baja, ¡¡REMÁTALO!!"
        sleep 4
        clear
    fi

done
