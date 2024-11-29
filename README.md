import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.text.DecimalFormat;
import java.util.Scanner;
import java.util.ArrayList;
import java.io.FileWriter;

public class Pizza {
    public static ArrayList<Producto> carrito = new ArrayList<>();

    public static Scanner sc = new Scanner(System.in);

    public static double total = 0;

    public static final double IGV = 0.18;

    public static Map<String, String> cuentas = new HashMap<>();

    public static final String USUARIO_PREDETERMINADO = "ben";
    public static final String CONTRASENA_PREDETERMINADA = "23";

    public static void main(String[] args) {

        while (true) {

            final String RESET = "\u001B[0m";
            final String RED = "\u001B[31m";
            final String GREEN = "\u001B[32m";
            final String YELLOW = "\u001B[33m";
            final String BLUE = "\u001B[34m";
            final String PURPLE = "\u001B[35m";
            final String CYAN = "\u001B[36m";



            System.out.println(CYAN + "❈══════════════════════════════════════════════════════════════════════════════❈" + RESET);
            System.out.println(PURPLE + "║                           ⚜️  " + GREEN + "BIENVENIDOS" + PURPLE + "  ⚜️                                ║" + RESET);
            System.out.println("║                                                                               ║");
            System.out.println("║                    " + YELLOW + "╔══════════════════════════════╗" + RESET + "                           ║");
            System.out.println("║                    " + YELLOW + "║      MENÚ DE OPCIONES        ║" + RESET + "                           ║");
            System.out.println("║                    " + YELLOW + "╚══════════════════════════════╝" + RESET + "                           ║");
            System.out.println("║                                                                               ║");
            System.out.println("║                   ✧･ﾟ: *✧･ﾟ:* " + CYAN + "❋" + RESET + " *:･ﾟ✧*:･ﾟ✧                                    ║");
            System.out.println("║                                                                                ║");
            System.out.println("║                     " + BLUE + "【 1 】" + RESET + "  Crear Cuenta Nueva                                 ║");
            System.out.println("║                                                                                ║");
            System.out.println("║                     " + RED + "【 2 】" + RESET + "  Usar Cuenta Existente                             ║");
            System.out.println("║                                                                                ║");
            System.out.println("║                   ✧･ﾟ: *✧･ﾟ:* " + CYAN + "❋" + RESET + " *:･ﾟ✧*:･ﾟ✧                                     ║");
            System.out.println("║                                                                                ║");
            System.out.println("║                    " + YELLOW + "Por favor, seleccione una opción" + RESET + "                           ║");
            System.out.println("║                                                                                ║");
            System.out.println(CYAN + "❈══════════════════════════════════════════════════════════════════════════════❈" + RESET);
            System.out.print("        Opción: ");
            int opcionCuenta = sc.nextInt();
            sc.nextLine();
            if (opcionCuenta == 1) {
                crearCuenta();
            } else if (opcionCuenta == 2) {
                if (usarCuentaExistente()) {
                    break;
                } else {
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                              Credenciales incorrectas. Intente nuevamente.");
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                }
            } else {
                System.out.println("----------------------------------------------------------------------------------------------------------");
                System.out.println("                                         Opción inválida.");
                System.out.println("----------------------------------------------------------------------------------------------------------");
            }
        }
        boolean continuarPedido = true;
        logo();
        while (continuarPedido) {


            mostrarMenu();
            int opcion = obtenerOpcionDelUsuario();
            switch (opcion) {
                case 1:
                    procesarPizza();
                    break;
                case 2:
                    procesarAntojos();
                    break;
                case 3:
                    procesarBebidas();
                    break;
                case 4:
                    procesarParaMi();
                    break;
                case 5:
                    procesarOfertas();
                    break;
                case 6:
                    procesarCombosHuts();
                    break;
                case 7:
                    procesarLasMasHuts();
                    break;

                case 8:
                    medotoPago();
                    continuarPedido = false;

                    break;
                case 9:
                    mostrarCarrito();
                    break;
                default:
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                        Opción inválida.");
                    System.out.println("----------------------------------------------------------------------------------------------------------");
            }
        }

    }

    public static void crearCuenta() {
        System.out.println("----------------------------------------------------------------------------------------------------------");
        System.out.print("           Ingrese su nombre de usuario: ");
        String username = sc.nextLine();
        System.out.print("           Ingrese su contraseña: ");
        String password = sc.nextLine();
        System.out.println("----------------------------------------------------------------------------------------------------------");

        if (cuentas.containsKey(username)) {
            System.out.println("El nombre de usuario ya existe. Intente con otro.");
        } else {
            cuentas.put(username, password);
            System.out.println("Cuenta creada exitosamente. Bienvenido, " + username + "!");
        }
    }

    public static boolean usarCuentaExistente() {
        System.out.println("----------------------------------------------------------------------------------------------------------");
        System.out.print("           Ingrese su nombre de usuario: ");
        String username = sc.nextLine();
        System.out.print("           Ingrese su contraseña: ");
        String password = sc.nextLine();
        if (username.equals(USUARIO_PREDETERMINADO) && password.equals(CONTRASENA_PREDETERMINADA)) {
            return true;
        }

        return cuentas.getOrDefault(username, "").equals(password);
    }

    public static void logo() {
        System.out.println("                                     B I E N V E N I D O ");


        
        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";

        System.out.println("""
                                    ⠀⠀⠀⠀                          ✨ 🍕 ⭐️ 🌟 ✨ 🍕 ⭐️ 🌟 ✨  """);

        System.out.println(RED +     "                     ██████╗ ██╗██╗  ██╗ █████╗ ██╗██╗     ██╗   ██╗" + RESET);
        System.out.println(YELLOW + "                     ██╔══██╗██║██║  ██║██╔══██╗██║██║     ██║   ██║" + RESET);
        System.out.println(GREEN +   "                     ██████╔╝██║███████║███████║██║██║     ██║   ██║" + RESET);
        System.out.println(CYAN +    "                     ██╔═══╝ ██║██╔══██║██╔══██║██║██║     ██║   ██║" + RESET);
        System.out.println(BLUE +    "                     ██║     ██║██║  ██║██║  ██║██║███████╗╚██████╔╝" + RESET);
        System.out.println(PURPLE +  "                     ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝" + RESET);


        System.out.println("\n" + "                           ╔══════════════════════════════════════════╗");
        System.out.println(RED + "                           ║" + YELLOW + "   P" + GREEN + "   I" + CYAN + "   Z" + BLUE + "   Z" + PURPLE + "   A" + RED + "      H" + YELLOW + "   U" + GREEN + "   D   " + RESET +        "║");
        System.out.println("                           ╚══════════════════════════════════════════╝");
        System.out.println("\n                                 🍕 La Mejor Pizza del Mundo 🍕");
    }

    public static class Producto {
        String nombre;
        double precio;
        int cantidad;

        public Producto(String nombre, double precio, int cantidad) {
            this.nombre = nombre;
            this.precio = precio;
            this.cantidad = cantidad;
        }

        public double calcularSubtotal() {
            return precio * cantidad;
        }
    }

    public static void mostrarMenu() {

        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";

        System.out.println("""
            
            ╔══════════════════════════════════════════════════════════════════════════════╗
            ║                                                                              ║
            ║                    🌟 ⭐️  MENÚ PRINCIPAL PIZZAILU  ⭐️ 🌟                    ║
            ║                                                                              ║
            ╠══════════════════════════════════════════════════════════════════════════════╣
            """);
        System.out.println(RED +    "║    【 1 】  🍕 Pedir Pizza                                                    ║");
        System.out.println(YELLOW + "║    【 2 】  🍗 Pedir Antojos                                                 ║");
        System.out.println(GREEN +  "║    【 3 】  🥤 Pedir Bebidas                                                 ║");
        System.out.println(CYAN +   "║    【 4 】  ⭐️ Pedir Para Mí                                                 ║");
        System.out.println(BLUE +   "║    【 5 】  💫 Pedir Ofertas                                                 ║");
        System.out.println(PURPLE + "║    【 6 】  🌟 Pedir Combos Huts                                             ║");
        System.out.println(RED +    "║    【 7 】  ✨ Pedir Las Más Huts                                            ║");
        System.out.println(YELLOW + "║    【 8 】  💝 Finalizar Pedido                                              ║");
        System.out.println(GREEN +  "║    【 9 】  🛒 Mostrar Carrito                                               ║" + RESET);

        System.out.println("""
            ║                                                                              ║
            ╠══════════════════════════════════════════════════════════════════════════════╣
            ║                      🍕 ¡Disfruta de nuestro sabor! 🍕                       ║
            ╚══════════════════════════════════════════════════════════════════════════════╝
            """);

        System.out.println("                    Seleccione una opción (1-9) para continuar");
        System.out.println("                    ⭐️ Tu satisfacción es nuestra prioridad ⭐️\n");
    }

    public static int obtenerOpcionDelUsuario() {
        System.out.print("Seleccione una opción: ");
        return sc.nextInt();
    }

    public static void procesarPizza() {
        while (true) {

            final String RESET = "\u001B[0m";
            final String RED = "\u001B[31m";
            final String GREEN = "\u001B[32m";
            final String YELLOW = "\u001B[33m";
            final String BLUE = "\u001B[34m";
            final String PURPLE = "\u001B[35m";
            final String CYAN = "\u001B[36m";

            System.out.println("\n" + RED + """
        ╔═══════════════════════════════════════════════════════════════════════════════════╗
        ║     ⭐️ 🍕 ✨  BIENVENIDO A NUESTRA MÁGICA CARTA DE PIZZAS  ✨ 🍕 ⭐️           ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

            System.out.println(YELLOW + """
        ║                  Donde cada bocado es una explosión de sabor                      ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);


            System.out.println(RED +    "║ 【1】 4 HITS EN 1" + YELLOW + "     ✦ Cuatro mundos de sabor en una sola pizza! 🎭        ║");
            System.out.println(GREEN +  "║ 【2】 LA CHILI HUT" + CYAN + "   ✦ Para valientes amantes del picante 🌶️ 🔥               ║");
            System.out.println(BLUE +   "║ 【3】 SUPER SUPREMA" + PURPLE + " ✦ La reina indiscutible de nuestras pizzas 👑           ║");
            System.out.println(YELLOW + "║ 【4】 CHICKEN BBQ" + RED + "    ✦ Pollo BBQ que conquistará tu paladar 🍗                 ║");
            System.out.println(CYAN +   "║ 【5】 HAWAIANA" + GREEN + "      ✦ El paraíso tropical en cada bocado 🌺 🍍               ║");
            System.out.println(PURPLE + "║ 【6】 AMERICANA" + BLUE + "     ✦ El sabor clásico que todos aman 🇺🇸                       ║");
            System.out.println(RED +    "║ 【7】 CONTINENTAL" + YELLOW + "  ✦ Un viaje gastronómico por el mundo 🌍                   ║");
            System.out.println(GREEN +  "║ 【8】 PEPPERONI" + CYAN + "     ✦ ¡Doble pepperoni para doble felicidad! 🎯                ║");
            System.out.println(BLUE +   "║ 【9】 XL CLÁSICA" + PURPLE + "   ✦ Tamaño gigante para aventuras gigantes 📏               ║");
            System.out.println(YELLOW + "║【10】 SUPREMA" + RED + "       ✦ ¡La perfecta armonía de ingredientes! ✨                  ║");
            System.out.println(CYAN +   "║【11】 MOZZARELLA" + GREEN + "   ✦ El arte de la simplicidad en su máxima expresión 🧀      ║");
            System.out.println(PURPLE + "║【12】 MEAT LOVERS" + BLUE + "   ✦ El festín carnívoro definitivo 🥩                        ║");
            System.out.println(RED +    "║【13】 VEGETARIANA" + YELLOW + "  ✦ Jardín de sabores frescos y naturales 🥬                ║");

            System.out.println(CYAN + """
        ╠═══════════════════════════════════════════════════════════════════════════════════╣
        ║                     ✨ INFORMACIÓN IMPORTANTE ✨                                   ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

            System.out.println(PURPLE + """
        ║  🌟 Todas nuestras pizzas están hechas con ingredientes premium seleccionados    ║
        ║  🌟 Masa fresca preparada diariamente                                            ║
        ║  🌟 Horneadas en el momento para máxima frescura                                 ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

            System.out.println(BLUE + "║              【0】 Volver al menú principal - ⬅️ Regresar                     ║");
            System.out.println(RED + """
        ╚═══════════════════════════════════════════════════════════════════════════════════╝
        """ + RESET);

            System.out.print(YELLOW + "✨ ¿Qué aventura de sabor te gustaría probar hoy? (Ingresa el número): " + RESET);

            int opcion = sc.nextInt();
            sc.nextLine();

            if (opcion == 0) {
                System.out.println("----------------------------------------------------------------------------------------------------------");
                System.out.println("                    ¡No hay problema! Volvamos al menú principal 😊");
                System.out.println("----------------------------------------------------------------------------------------------------------");
                return;
            }

            switch (opcion) {
                case 1:
                    procesar4HitsEn1();
                    break;
                case 2:
                    procesarLaChiliHut();
                    break;
                case 3:
                    procesarSuperSuprema();
                    break;
                case 4:
                    procesarChickenBBQ();
                    break;
                case 5:
                    procesarHawaiana();
                    break;
                case 6:
                    procesarAmericana();
                    break;
                case 7:
                    procesarContinental();
                    break;
                case 8:
                    procesarPepperonii();
                    break;
                case 9:
                    procesarXLClasica();
                    break;
                case 10:
                    procesarSuprema();
                    break;
                case 11:
                    procesarMozzarella();
                    break;
                case 12:
                    procesarMeatlovers();
                    break;
                case 13:
                    procesarVegetariana();
                    break;
                default:
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("           ¡Ups! Esa opción no está en nuestro menú. ¿Podrías elegir otra? 😅");
                    System.out.println("----------------------------------------------------------------------------------------------------------");
            }
        }
    }

    public static void procesar4HitsEn1() {
        System.out.println("\nMenú de 4 hits en 1:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamaño = sc.nextInt();
        sc.nextLine();

        switch (tamaño) {

            case 1:
                System.out.println("\nMediana:");
                System.out.println("- Artesanal: $19.90");
                System.out.println("- Pan pizza: $19.90");
                System.out.println("- Hut cheese (Borde de queso): $25.90");
                break;

            case 2:
                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $29.90");
                System.out.println("- Pan pizza: $29.90");
                System.out.println("- Hut cheese (Borde de queso): $35.90");
                break;

            case 3:
                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $35.90");
                System.out.println("- Pan pizza: $39.90");
                System.out.println("- Hut cheese (Borde de queso): $45.90");
                break;

            default:
                System.out.println("Tamaño inválido.");
        }

        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();

        System.out.println("-----------------------------------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

        switch (tamaño) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 19.90;
                        tipoPizza = "|4 Hits En 1| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 19.90;
                        tipoPizza = "|4 Hits En 1| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 25.90;
                        tipoPizza = "|4 Hits En 1| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 29.90;
                        tipoPizza = "|4 Hits En 1| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 29.90;
                        tipoPizza = "|4 Hits En 1| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 35.90;
                        tipoPizza = "|4 Hits En 1| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 39.90;
                        tipoPizza = "|4 Hits En 1| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 39.90;
                        tipoPizza = "|4 Hits En 1| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 45.90;
                        tipoPizza = "|4 Hits En 1| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }


        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;

    }

    public static void procesarLaChiliHut() {
        System.out.println("\nMenú de La chili hut:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamaño = sc.nextInt();
        sc.nextLine();

        switch (tamaño) {

            case 1:
                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $30.90");
                System.out.println("- Pan pizza: $30.90");
                System.out.println("- Hut cheese (Borde de queso): $36.90");
                break;

            case 2:
                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $39.90");
                System.out.println("- Pan pizza: $39.90");
                System.out.println("- Hut cheese (Borde de queso): $45.90");
                break;

            case 3:
                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $49.90");
                System.out.println("- Pan pizza: $49.90");
                System.out.println("- Hut cheese (Borde de queso): $55.90");
                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

        // Definición de precios según tamaño y tipo
        switch (tamaño) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 30.90; // Mediana Artesanal
                        tipoPizza = "|La Chili Hut| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "|La Chili Hut| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "|La Chili Hut| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 39.90; // Grande Artesanal
                        tipoPizza = "|La Chili Hut| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "|La Chili Hut| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "|La Chili Hut| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 49.90; // Familiar Artesanal
                        tipoPizza = "|La Chili Hut| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "|La Chili Hut| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "|La Chili Hut| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarSuperSuprema() {
        System.out.println("\nMenú de Super suprema:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $35.90");
                System.out.println("- Pan pizza: $35.90");
                System.out.println("- Hut cheese (Borde de queso): $36.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $39.90");
                System.out.println("- Pan pizza: $39.90");
                System.out.println("- Hut cheese (Borde de queso): $45.90");
                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $49.90");
                System.out.println("- Pan pizza: $49.90");
                System.out.println("- Hut cheese (Borde de queso): $55.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";


        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 35.90; // Mediana Artesanal
                        tipoPizza = "|Super Suprema| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 35.90; // Mediana Pan pizza
                        tipoPizza = "|Super Suprema| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "|Super Suprema| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 39.90; // Grande Artesanal
                        tipoPizza = "|Super Suprema| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "|Super Suprema| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "|Super Suprema| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 49.90; // Familiar Artesanal
                        tipoPizza = "|Super Suprema| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "|Super Suprema| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "|Super Suprema| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }
        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }


    public static void procesarChickenBBQ() {
        System.out.println("\nMenú de Chicken BBQ:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:
                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $30.90");
                System.out.println("- Pan pizza: $30.90");
                System.out.println("- Hut cheese (Borde de queso): $36.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $39.90");
                System.out.println("- Pan pizza: $39.90");
                System.out.println("- Hut cheese (Borde de queso): $45.90");
                break;

            case 3:
                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $49.90");
                System.out.println("- Pan pizza: $49.90");
                System.out.println("- Hut cheese (Borde de queso): $55.90");
                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 30.90; // Mediana Artesanal
                        tipoPizza = "|Chicken BBQ| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "|Chicken BBQ| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "|Chicken BBQ| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 39.90; // Grande Artesanal
                        tipoPizza = "|Chicken BBQ| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "|Chicken BBQ| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "|Chicken BBQ| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 49.90; // Familiar Artesanal
                        tipoPizza = "|Chicken BBQ| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "|Chicken BBQ| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "|Chicken BBQ| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }
        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarHawaiana() {
        System.out.println("\nMenú de Hawaiana:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();


        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $25.90");
                System.out.println("- Pan pizza: $25.90");
                System.out.println("- Hut cheese (Borde de queso): $31.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $32.90");
                System.out.println("- Pan pizza: $32.90");
                System.out.println("- Hut cheese (Borde de queso): $38.90");
                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $42.90");
                System.out.println("- Pan pizza: $42.90");
                System.out.println("- Hut cheese (Borde de queso): $48.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 25.90; // Mediana Artesanal
                        tipoPizza = "|Hawaiana| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "|Hawaiana| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "|Hawaiana| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 32.90; // Grande Artesanal
                        tipoPizza = "|Hawaiana| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "|Hawaiana| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "|Hawaiana| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 42.90; // Familiar Artesanal
                        tipoPizza = "|Hawaiana| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "|Hawaiana| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "|Hawaiana| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }


        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarAmericana() {
        System.out.println("\nMenú de Americana:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $20.90");
                System.out.println("- Pan pizza: $20.90");
                System.out.println("- Hut cheese (Borde de queso): $26.90");

                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $27.90");
                System.out.println("- Pan pizza: $27.90");
                System.out.println("- Hut cheese (Borde de queso): $33.90");

                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $37.90");
                System.out.println("- Pan pizza: $37.90");
                System.out.println("- Hut cheese (Borde de queso): $43.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }

        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 20.90; // Mediana Artesanal
                        tipoPizza = "|Americana| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "|Americana| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "|Americana| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 27.90; // Grande Artesanal
                        tipoPizza = "|Americana| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "|Americana| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "|Americana| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 37.90; // Familiar Artesanal
                        tipoPizza = "|Americana| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "|Americana| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "|Americana| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }


        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;

    }

    public static void procesarContinental() {
        System.out.println("\nMenú de Continental:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();


        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $25.90");
                System.out.println("- Pan pizza: $25.90");
                System.out.println("- Hut cheese (Borde de queso): $31.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $32.90");
                System.out.println("- Pan pizza: $32.90");
                System.out.println("- Hut cheese (Borde de queso): $38.90");
                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $42.90");
                System.out.println("- Pan pizza: $42.90");
                System.out.println("- Hut cheese (Borde de queso): $48.90");
                break;

            default:
                System.out.println("Tamaño inválido.");
        }

        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();


        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 25.90; // Mediana Artesanal
                        tipoPizza = "|Continental| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "|Continental| - Mediana ArtesanalMediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "|Continental| - Mediana ArtesanalMediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 32.90; // Grande Artesanal
                        tipoPizza = "|Continental| - Mediana ArtesanalGrande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "|Continental| - Mediana ArtesanalGrande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "|Continental| - Mediana ArtesanalGrande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 42.90; // Familiar Artesanal
                        tipoPizza = "|Continental| - Mediana ArtesanalFamiliar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "|Continental| - Mediana ArtesanalFamiliar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "|Continental| - Mediana ArtesanalFamiliar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarPepperonii() {
        System.out.println("\nMenú de Pepperonii:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $20.90");
                System.out.println("- Pan pizza: $20.90");
                System.out.println("- Hut cheese (Borde de queso): $26.90");

                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $27.90");
                System.out.println("- Pan pizza: $27.90");
                System.out.println("- Hut cheese (Borde de queso): $33.90");

                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $37.90");
                System.out.println("- Pan pizza: $37.90");
                System.out.println("- Hut cheese (Borde de queso): $43.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }

        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 20.90; // Mediana Artesanal
                        tipoPizza = "|Pepperoni| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "|Pepperoni| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "|Pepperoni| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 27.90; // Grande Artesanal
                        tipoPizza = "|Pepperoni| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "|Pepperoni| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "|Pepperoni| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 37.90; // Familiar Artesanal
                        tipoPizza = "|Pepperoni| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "|Pepperoni| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "|Pepperoni| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarXLClasica() {
        System.out.println("\nMenú de XL Clásica:");
        System.out.println("1. XL Pan Pizza - $66.90");
        System.out.println("2. XL Artesanal - $66.90");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

        switch (tipo) {
            case 1:
                precio = 66.90; // XL Pan Pizza
                tipoPizza = "XL Pan Pizza";
                break;
            case 2:
                precio = 66.90; // XL Artesanal
                tipoPizza = "XL Artesanal";
                break;
            default:
                System.out.println("Tipo de pizza inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;

    }

    public static void procesarSuprema() {
        System.out.println("\nMenú de Suprema:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $25.90");
                System.out.println("- Pan pizza: $25.90");
                System.out.println("- Hut cheese (Borde de queso): $31.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $32.90");
                System.out.println("- Pan pizza: $32.90");
                System.out.println("- Hut cheese (Borde de queso): $38.90");
                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $42.90");
                System.out.println("- Pan pizza: $42.90");
                System.out.println("- Hut cheese (Borde de queso): $48.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 25.90; // Mediana Artesanal
                        tipoPizza = "|Suprema| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "|Suprema| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "|Suprema| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 32.90; // Grande Artesanal
                        tipoPizza = "|Suprema| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "|Suprema| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "|Suprema| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 42.90; // Familiar Artesanal
                        tipoPizza = "|Suprema| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "|Suprema| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "|Suprema| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarMozzarella() {
        System.out.println("\nMenú de Mozzarella:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $20.90");
                System.out.println("- Pan pizza: $20.90");
                System.out.println("- Hut cheese (Borde de queso): $26.90");

                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $27.90");
                System.out.println("- Pan pizza: $27.90");
                System.out.println("- Hut cheese (Borde de queso): $33.90");

                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $37.90");
                System.out.println("- Pan pizza: $37.90");
                System.out.println("- Hut cheese (Borde de queso): $43.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 20.90; // Mediana Artesanal
                        tipoPizza = "|Mozzarella| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "|Mozzarella| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "|Mozzarella| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 27.90; // Grande Artesanal
                        tipoPizza = "|Mozzarella| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "|Mozzarella| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "|Mozzarella| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 37.90; // Familiar Artesanal
                        tipoPizza = "|Mozzarella| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "|Mozzarella| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "|Mozzarella| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }
        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarMeatlovers() {
        System.out.println("\nMenú de Meatlovers:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:
                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $30.90");
                System.out.println("- Pan pizza: $30.90");
                System.out.println("- Hut cheese (Borde de queso): $36.90");
                break;

            case 2:
                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $39.90");
                System.out.println("- Pan pizza: $39.90");
                System.out.println("- Hut cheese (Borde de queso): $45.90");
                break;

            case 3:
                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $49.90");
                System.out.println("- Pan pizza: $49.90");
                System.out.println("- Hut cheese (Borde de queso): $55.90");
                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 30.90; // Mediana Artesanal
                        tipoPizza = "|Meat Lovers| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "|Meat Lovers| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "|Meat Lovers| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 39.90; // Grande Artesanal
                        tipoPizza = "|Meat Lovers| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "|Meat Lovers| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "|Meat Lovers| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 49.90; // Familiar Artesanal
                        tipoPizza = "|Meat Lovers| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "|Meat Lovers| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "|Meat Lovers| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarVegetariana() {
        System.out.println("\nMenú de Vegetariana:");
        System.out.println("1. Mediana");
        System.out.println("2. Grande");
        System.out.println("3. Familiar");
        System.out.print("Seleccione un tamaño: ");
        int tamano = sc.nextInt();
        sc.nextLine();

        switch (tamano) {

            case 1:

                System.out.println("\nPrecios disponibles:");
                System.out.println("Mediana:");
                System.out.println("- Artesanal: $25.90");
                System.out.println("- Pan pizza: $25.90");
                System.out.println("- Hut cheese (Borde de queso): $31.90");
                break;

            case 2:

                System.out.println("\nGrande:");
                System.out.println("- Artesanal: $32.90");
                System.out.println("- Pan pizza: $32.90");
                System.out.println("- Hut cheese (Borde de queso): $38.90");
                break;

            case 3:

                System.out.println("\nFamiliar:");
                System.out.println("- Artesanal: $42.90");
                System.out.println("- Pan pizza: $42.90");
                System.out.println("- Hut cheese (Borde de queso): $48.90");

                break;

            default:
                System.out.println("Tamaño inválido.");
        }


        System.out.println("\nTipos de pizza:");
        System.out.println("1. Artesanal");
        System.out.println("2. Pan pizza");
        System.out.println("3. Hut cheese (Borde de queso)");
        System.out.print("Seleccione un tipo: ");
        int tipo = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántas pizzas desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();
        System.out.println("--------------------------------------------");

        double precio = 0;
        String tipoPizza = "";

// Definición de precios según tamaño y tipo
        switch (tamano) {
            case 1: // Mediana
                switch (tipo) {
                    case 1:
                        precio = 25.90; // Mediana Artesanal
                        tipoPizza = "|Vegetariana| - Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "|Vegetariana| - Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "|Vegetariana| - Mediana Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 2: // Grande
                switch (tipo) {
                    case 1:
                        precio = 32.90; // Grande Artesanal
                        tipoPizza = "|Vegetariana| - Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "|Vegetariana| - Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "|Vegetariana| - Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 42.90; // Familiar Artesanal
                        tipoPizza = "|Vegetariana| - Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "|Vegetariana| - Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "|Vegetariana| - Familiar Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            default:
                System.out.println("Tamaño inválido.");
                return;
        }

        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoPizza, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarAntojos() {
        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";

        System.out.println("""
        
        ╔═══════════════════════════════════════════════════════════════════╗
        ║           ✨ BIENVENIDO AL MUNDO DE LOS ANTOJOS ✨               ║
        ╠═══════════════════════════════════════════════════════════════════╣
        ║          Donde cada bocado es una explosión de sabor             ║
        ╠═══════════════════════════════════════════════════════════════════╣
""");

        System.out.println(RED +    "║  【1】  🥨 SALADOS                                              ║");
        System.out.println(        "║        ┗━━ Deliciosos snacks para picar                       ║");
        System.out.println(YELLOW + "║                                                                 ║");
        System.out.println(PURPLE + "║  【2】  🍪 DULCES                                               ║");
        System.out.println(        "║        ┗━━ Endulza tu día con nuestros postres                ║");
        System.out.println(YELLOW + "║                                                                 ║");
        System.out.println(GREEN +  "║  【3】  🌶️ SALSAS                                               ║");
        System.out.println(        "║        ┗━━ El complemento perfecto para tus antojos           ║");
        System.out.println(YELLOW + "║                                                                 ║");
        System.out.println(BLUE +   "║  【4】  ⬅️ VOLVER                                               ║");
        System.out.println(        "║        ┗━━ Regresar al menú principal                         ║");

        System.out.println(YELLOW + """
        ╠═══════════════════════════════════════════════════════════════════╣
        ║            🌟 ¡Complementa tu pizza a la perfección! 🌟           ║
        ╚═══════════════════════════════════════════════════════════════════╝
""" + RESET);

        System.out.print(CYAN + "✨ Seleccione una opción (1-4): " + RESET);
        int antojitos = sc.nextInt();
        String tipoPizza;
        switch (antojitos) {
            case 1:
                System.out.println("""
                                                 ¿Algunos Antojitos Salados?
                                                    Tenemos estas opciones
                        
                        Opcion 1: (PALITOS A LA SILICIANA)        | Pack de 6 y 10 palitos a la siliciana acompañados |
                        Precio:   6 UNIDADES $9.90                |    acompañados con nuestra salsa mediterranea     |
                                  10 UNIDADES $11.90
                        
                        Opcion 2: (PAN AL AJO)                    |                ¡SUPER CROCANTES!                  |
                        Precio:   4 UNIDADES $10.90               |  4 panes al ajo con el toque perfecto de orégano. |
                        
                        Opcion 3: (PAN AL AJO ESPECIAL)           |            ¡PARA HACER TU DÍA ESPECIAL!           |
                        Precio:   4 UNIDADES $13.90               |         4 panes al ajo con queso y orégano.       |
                        
                        Opcion 4: (ROLLS DE JAMON & QUESO)        |               ¡RELLENOS DE SABOR!                 |
                        Precio:   6 UNIDADES $15.90               |         6 rolls rllenos de jamon y queso.         |
                        
                        Opcion 5: (ALITAS)
                        Precio:   6 UNIDADES, SALSA HUT $15.90    |               ¡EL COMPLEMENTO PERFECTO!           |
                                  6 UNIDADES, SALSA BBQ $15.90    | Pack de 6 y 9 alitas bañadas en tu salsa favorita.|
                                  6 UNIDADES, SIN SALSA $15.90
                                  9 UNIDADES, SALSA HUT $20.90
                                  9 UNIDADES, SALSA BBQ $20.90
                                  9 UNIDADES, SIN SALSA $20.90
                        
                        
                        Opcion 6: (HUT BREAD)                     |                  ¡FULL QUESO!                     |
                        Precio: 8 UNIDADES DE QUESO $13.90        |   8 Palitos rellenos de queso y disponibles en    |
                                8 UNIDADES HAWAIANO $16.90        |                   3 sabores                       |
                        
                        Opcion 7: No""");

                int salados = sc.nextInt();
                switch (salados) {
                    case 1:
                        System.out.println("¿Cuantos comprara");
                        System.out.println("Seleccione las opciones");
                        System.out.println("Opcion 1.- 6 Unidades ");
                        System.out.println("Opcion 2.- 10 Unidades ");
                        int cantidadP = sc.nextInt();
                        switch (cantidadP) {
                            case 1:
                                System.out.println("¿Cuantos palitos a la siliciana comprara?");
                                int cantidadPalitos6 = sc.nextInt();
                                double precioTotal = 9.90 * cantidadPalitos6;
                                double subtotal = precioTotal / (1 + IGV);
                                double montoIGV = precioTotal - subtotal;
                                tipoPizza = "PALITOS A LA SILICIANA - 6 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotal, cantidadPalitos6));
                                System.out.println("Añadido al carrito: " + cantidadPalitos6 + " x " + tipoPizza + " = " + precioTotal);

                                System.out.printf("Subtotal: %.2f%n", subtotal);
                                System.out.printf("IGV: %.2f%n", montoIGV);
                                System.out.printf("Precio Total: %.2f%n", precioTotal);
                                total += precioTotal;
                                break;
                            case 2:
                                System.out.println("¿Cuantos palitos a la siliciana comprara?");
                                int cantidadPalitos10 = sc.nextInt();
                                double precioTotal10 = 11.90 * cantidadPalitos10;
                                double subtotal10 = precioTotal10 / (1 + IGV);
                                double montoIGV10 = precioTotal10 - subtotal10;
                                tipoPizza = "PALITOS A LA SILICIANA - 10 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotal10, cantidadPalitos10));
                                System.out.println("Añadido al carrito: " + cantidadPalitos10 + " x " + tipoPizza + " = " + precioTotal10);

                                System.out.printf("Subtotal: %.2f%n", subtotal10);
                                System.out.printf("IGV: %.2f%n", montoIGV10);
                                System.out.printf("Precio Total: %.2f%n", precioTotal10);
                                total += precioTotal10;
                                break;
                            default:
                                System.out.println("");
                        }
                        return;
                    case 2:
                        System.out.println("¿Cuantas unidades de Pan al Ajo comprara?");
                        int cantidadPan = sc.nextInt();
                        double precioTotal = 10.90 * cantidadPan;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;
                        tipoPizza = "PAN AL AJO - 4 Unidades";
                        carrito.add(new Producto(tipoPizza, precioTotal, cantidadPan));
                        System.out.println("Añadido al carrito: " + cantidadPan + " x " + tipoPizza + " = " + precioTotal);

                        System.out.printf("Subtotal: %.2f%n", subtotal);
                        System.out.printf("IGV: %.2f%n", montoIGV);
                        System.out.printf("Precio Total: %.2f%n", precioTotal);
                        total += precioTotal;
                        break;
                    case 3:
                        System.out.println("¿Cuantas unidades de Pan al Ajo Especial comprara?");
                        int cantidadE = sc.nextInt();
                        double precioTotalE = 13.90 * cantidadE;
                        double subtotalE = precioTotalE / (1 + IGV);
                        double montoIGVE = precioTotalE - subtotalE;
                        tipoPizza = "PAN AL AJO ESPECIAL - 4 Unidades";
                        carrito.add(new Producto(tipoPizza, precioTotalE, cantidadE));
                        System.out.println("Añadido al carrito: " + cantidadE + " x " + tipoPizza + " = " + precioTotalE);

                        System.out.printf("Subtotal: %.2f%n", subtotalE);
                        System.out.printf("IGV: %.2f%n", montoIGVE);
                        System.out.printf("Precio Total: %.2f%n", precioTotalE);
                        total += precioTotalE;
                        break;
                    case 4:
                        System.out.println("¿Cuantas unidades de Rolls comprara?");
                        int cantidadR = sc.nextInt();
                        double precioTotalR = 15.90 * cantidadR;
                        double subtotalR = precioTotalR / (1 + IGV);
                        double montoIGVR = precioTotalR - subtotalR;
                        tipoPizza = "ROLLS DE JAMON & QUESO - 6 unidades";
                        carrito.add(new Producto(tipoPizza, precioTotalR, cantidadR));
                        System.out.println("Añadido al carrito: " + cantidadR + " x " + tipoPizza + " = " + precioTotalR);

                        System.out.printf("Subtotal: %.2f%n", subtotalR);
                        System.out.printf("IGV: %.2f%n", montoIGVR);
                        System.out.printf("Precio Total: %.2f%n", precioTotalR);
                        total += precioTotalR;
                        break;
                    case 5:
                        System.out.println("¿Cuantas unidades de Alitas comprara, solo tine para escoger entre 6U o 9U");
                        System.out.println("Seleccione el tipo de salsa");
                        System.out.println("Opcion 1.- 6 Uunidades con salsa HUT");
                        System.out.println("Opcion 2.- 6 Unidades con salsa BBQ");
                        System.out.println("Opcion 3.- 6 Unidades SIN SALSA");
                        System.out.println("Opcion 4.- 9 Unidades con salsa HUT");
                        System.out.println("Opcion 5.- 9 Unidades con salsa BBQ");
                        System.out.println("Opcion 6.- 9 Unidades SIN SALSA");
                        int cantidadA = sc.nextInt();
                        switch (cantidadA) {
                            case 1:
                                System.out.println("¿Cuantas alitas HUT comprara?");
                                int cantidadAlitasHUT = sc.nextInt();
                                double precioTotalhut = 15.90 * cantidadAlitasHUT;
                                double subtotalhut = precioTotalhut / (1 + IGV);
                                double montoIGVhut = precioTotalhut - subtotalhut;
                                tipoPizza = "ALITAS CON SALSA HUT - 6 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalhut, cantidadAlitasHUT));
                                System.out.println("Añadido al carrito: " + cantidadAlitasHUT + " x " + tipoPizza + " = " + precioTotalhut);

                                System.out.printf("Subtotal: %.2f%n", subtotalhut);
                                System.out.printf("IGV: %.2f%n", montoIGVhut);
                                System.out.printf("Precio Total: %.2f%n", precioTotalhut);
                                total += precioTotalhut;
                                break;
                            case 2:
                                System.out.println("¿Cuantas alitas BBQ comprara?");
                                int cantidadAlitasBBQ = sc.nextInt();
                                double precioTotalbbq = 15.90 * cantidadAlitasBBQ;
                                double subtotalbbq = precioTotalbbq / (1 + IGV);
                                double montoIGVBBQ = precioTotalbbq - subtotalbbq;
                                tipoPizza = "ALITAS CON SALSA BBQ - 6 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalbbq, cantidadAlitasBBQ));
                                System.out.println("Añadido al carrito: " + cantidadAlitasBBQ + " x " + tipoPizza + " = " + precioTotalbbq);

                                System.out.printf("Subtotal: %.2f%n", subtotalbbq);
                                System.out.printf("IGV: %.2f%n", montoIGVBBQ);
                                System.out.printf("Precio Total: %.2f%n", precioTotalbbq);
                                total += precioTotalbbq;
                                break;
                            case 3:
                                System.out.println("¿Cuantas alitas sin salsa comprara?");
                                int cantidadAlitasSIN = sc.nextInt();
                                double precioTotalsin = 15.90 * cantidadAlitasSIN;
                                double subtotalsin = precioTotalsin / (1 + IGV);
                                double montoIGVSIN = precioTotalsin - subtotalsin;
                                tipoPizza = "ALITAS SIN SALSA - 6 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalsin, cantidadAlitasSIN));
                                System.out.println("Añadido al carrito: " + cantidadAlitasSIN + " x " + tipoPizza + " = " + precioTotalsin);

                                System.out.printf("Subtotal: %.2f%n", subtotalsin);
                                System.out.printf("IGV: %.2f%n", montoIGVSIN);
                                System.out.printf("Precio Total: %.2f%n", precioTotalsin);
                                total += precioTotalsin;
                                break;
                            case 4:
                                System.out.println("¿Cuantas alitas HUT comprara?");
                                int cantidadAlitas9HUT = sc.nextInt();
                                double precioTotalHUT = 20.90 * cantidadAlitas9HUT;
                                double subtotalHUT = precioTotalHUT / (1 + IGV);
                                double montoIGVHut = precioTotalHUT - subtotalHUT;
                                tipoPizza = "ALITAS CON SALSA HUT- 9 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalHUT, cantidadAlitas9HUT));
                                System.out.println("Añadido al carrito: " + cantidadAlitas9HUT + " x " + tipoPizza + " = " + precioTotalHUT);

                                System.out.printf("Subtotal: %.2f%n", subtotalHUT);
                                System.out.printf("IGV: %.2f%n", montoIGVHut);
                                System.out.printf("Precio Total: %.2f%n", precioTotalHUT);
                                total += precioTotalHUT;
                                break;
                            case 5:
                                System.out.println("¿Cuantas unidades de alitas BBQ comprara?");
                                int cantidadAlitasBBQ9 = sc.nextInt();
                                double precioTotalBBQ9 = 20.90 * cantidadAlitasBBQ9;
                                double subtotalBBQ = precioTotalBBQ9 / (1 + IGV);
                                double montoIGVBBQ9 = precioTotalBBQ9 - subtotalBBQ;
                                tipoPizza = "ALITAS CON SALSA BBQ- 9 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalBBQ9, cantidadAlitasBBQ9));
                                System.out.println("Añadido al carrito: " + cantidadAlitasBBQ9 + " x " + tipoPizza + " = " + precioTotalBBQ9);

                                System.out.printf("Subtotal: %.2f%n", subtotalBBQ);
                                System.out.printf("IGV: %.2f%n", montoIGVBBQ9);
                                System.out.printf("Precio Total: %.2f%n", precioTotalBBQ9);
                                total += precioTotalBBQ9;
                                break;
                            case 6:
                                System.out.println("¿Cuantas alitas sin salsa comprara?");
                                int cantidadAlitas9SIN = sc.nextInt();
                                double precioTotalSIN = 20.90 * cantidadAlitas9SIN;
                                double subtotalSIN = precioTotalSIN / (1 + IGV);
                                double montoIGV9USIN = precioTotalSIN - subtotalSIN;
                                tipoPizza = "ALITAS SIN SALSA - 9 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalSIN, cantidadAlitas9SIN));
                                System.out.println("Añadido al carrito: " + cantidadAlitas9SIN + " x " + tipoPizza + " = " + precioTotalSIN);

                                System.out.printf("Subtotal: %.2f%n", subtotalSIN);
                                System.out.printf("IGV: %.2f%n", montoIGV9USIN);
                                System.out.printf("Precio Total: %.2f%n", precioTotalSIN);
                                total += precioTotalSIN;
                                break;
                            default:
                                System.out.println("");
                        }
                        return;
                    case 6:
                        System.out.println("¿Cuantos comprara");
                        System.out.println("Seleccione las opciones");
                        System.out.println("Opcion 1.- 8 Unidades de queso ");
                        System.out.println("Opcion 2.- 8 Unidades hawaiano ");
                        int cantidadBred = sc.nextInt();
                        switch (cantidadBred) {
                            case 1:
                                System.out.println("¿Cuantos HUT BREAD de queso comprara?");
                                int cantidadQ = sc.nextInt();
                                double precioTotalQ = 16.90 * cantidadQ;
                                double subtotalQ = precioTotalQ / (1 + IGV);
                                double montoIGVQ = precioTotalQ - subtotalQ;
                                tipoPizza = "HUT BREAD DE QUESO- 8 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalQ, cantidadQ));
                                System.out.println("Añadido al carrito: " + cantidadQ + " x " + tipoPizza + " = " + precioTotalQ);

                                System.out.printf("Subtotal: %.2f%n", subtotalQ);
                                System.out.printf("IGV: %.2f%n", montoIGVQ);
                                System.out.printf("Precio Total: %.2f%n", precioTotalQ);
                                total += precioTotalQ;
                                break;
                            case 2:
                                System.out.println("¿Cuantos HUT BREAD Hawaiano comprara?");
                                int cantidadH = sc.nextInt();
                                double precioTotalH = 16.90 * cantidadH;
                                double subtotalH = precioTotalH / (1 + IGV);
                                double montoIGVH = precioTotalH - subtotalH;
                                tipoPizza = "HUT BREAD HAWAIANO- 8 Unidades";
                                carrito.add(new Producto(tipoPizza, precioTotalH, cantidadH));
                                System.out.println("Añadido al carrito: " + cantidadH + " x " + tipoPizza + " = " + precioTotalH);

                                System.out.printf("Subtotal: %.2f%n", subtotalH);
                                System.out.printf("IGV: %.2f%n", montoIGVH);
                                System.out.printf("Precio Total: %.2f%n", precioTotalH);
                                total += precioTotalH;
                                break;
                        }
                    default:
                        System.out.println("");
                }
            case 2:
                System.out.println(""" 
                                              Ahh, ¿unos Antojitos Dulces?
                                                Tenemos estas opciones
                        
                        Opcion 1: (HUT CHURROS)          |       4 Hut Churros rellenos de manjar, decorados con     |
                        Precio:   4 UNIDADES $5.90       |                azúcar impalpable y canela.                |
                        
                        Opcion 2: (ROLLS DE MANJAR)      |               ¡MÁS MANJAR PARA DISFRUTAR!                 |
                        Precio:   6 UNIDADES $6.90       |              6 Rolls rellenos de manjar blanco.           |
                        
                        Opcion 3: (TARTA DE MANZANA)     |                          ¡POSTRE!                         |
                        Precio:   1 UNIDADES $5.90       |           Tarta de manzana hojaldre horneada,             |
                                                         |           rellena de compota de manzana y canela.         |
                        
                        Opcion 4: (VOLCAN DE LIMON)      | Suave Bizcochuelo relleno con exquisita crema sabor limón.|
                        Precio:   1 UNIDADES $10.90
                        
                        Opcion 5: (VOLCAN DE CHOCOLATE)  |    Delicioso keke sabor a chocolate con relleno líquido.  |
                        Precio:   1 UNIDADES $10.90
                        
                        Opcion 6: Volver
                        """);
                int dulces = sc.nextInt();
                switch (dulces) {
                    case 1:
                        System.out.println("¿Cuantos HUT CHURROS compraras?");
                        int cantidadChurros = sc.nextInt();
                        double precioTotal = 5.90 * cantidadChurros;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;
                        tipoPizza = "HUT CHURROS - 4 Unidades";
                        carrito.add(new Producto(tipoPizza, precioTotal, cantidadChurros));
                        System.out.println("Añadido al carrito: " + cantidadChurros + " x " + tipoPizza + " = " + precioTotal);

                        System.out.printf("Subtotal: %.2f%n", subtotal);
                        System.out.printf("IGV: %.2f%n", montoIGV);
                        System.out.printf("Precio Total: %.2f%n", precioTotal);
                        break;
                    case 2:
                        System.out.println("¿Cuantos ROLLOS DE MANJAR DE 6 UNIDADES comprara?");
                        int cantidadM = sc.nextInt();
                        double precioTotalM = 6.90 * cantidadM;
                        double subtotalM = precioTotalM / (1 + IGV);
                        double montoIGVR = precioTotalM - subtotalM;
                        tipoPizza = "ROLLS DE MANJAR - 6 Unidades";
                        carrito.add(new Producto(tipoPizza, precioTotalM, cantidadM));
                        System.out.println("Añadido al carrito: " + cantidadM + " x " + tipoPizza + " = " + precioTotalM);

                        System.out.printf("Subtotal: %.2f%n", subtotalM);
                        System.out.printf("IGV: %.2f%n", montoIGVR);
                        System.out.printf("Precio Total: %.2f%n", precioTotalM);
                        break;
                    case 3:
                        System.out.println("Cuantas unidades de TARTAS DE MANZANA comprara");
                        int cantidadT = sc.nextInt();
                        double precioTotalT = 5.90 * cantidadT;
                        double subtotalT = precioTotalT / (1 + IGV);
                        double montoIGVT = precioTotalT - subtotalT;
                        tipoPizza = "TARTA DE MANZANA - 1 Unidad";
                        carrito.add(new Producto(tipoPizza, precioTotalT, cantidadT));
                        System.out.println("Añadido al carrito: " + cantidadT + " x " + tipoPizza + " = " + precioTotalT);

                        System.out.printf("Subtotal: %.2f%n", subtotalT);
                        System.out.printf("IGV: %.2f%n", montoIGVT);
                        System.out.printf("Precio Total: %.2f%n", precioTotalT);
                        break;
                    case 4:
                        System.out.println("Cuantas unidades de VOLCAN DE LIMON comprara");
                        int cantidadL = sc.nextInt();
                        double precioTotalL = 10.90 * cantidadL;
                        double subtotalL = precioTotalL / (1 + IGV);
                        double montoIGVL = precioTotalL - subtotalL;
                        tipoPizza = "VOLCAN DE LIMON - 1 Unidad";
                        carrito.add(new Producto(tipoPizza, precioTotalL, cantidadL));
                        System.out.println("Añadido al carrito: " + cantidadL + " x " + tipoPizza + " = " + precioTotalL);

                        System.out.printf("Subtotal: %.2f%n", subtotalL);
                        System.out.printf("IGV: %.2f%n", montoIGVL);
                        System.out.printf("Precio Total: %.2f%n", precioTotalL);
                        break;
                    case 5:
                        System.out.println("Cuantas unidades de VOLCAN DE CHOCOLATE comprara");
                        int cantidadC = sc.nextInt();
                        double precioTotalC = 10.90 * cantidadC;
                        double subtotalC = precioTotalC / (1 + IGV);
                        double montoIGVC = precioTotalC - subtotalC;
                        tipoPizza = "VOLCAN DE CHOCOLATE - 1 Unidad";
                        carrito.add(new Producto(tipoPizza, precioTotalC, cantidadC));
                        System.out.println("Añadido al carrito: " + cantidadC + " x " + tipoPizza + " = " + precioTotalC);

                        System.out.printf("Subtotal: %.2f%n", subtotalC);
                        System.out.printf("IGV: %.2f%n", montoIGVC);
                        System.out.printf("Precio Total: %.2f%n", precioTotalC);
                        break;
                    default:
                        System.out.println("");
                }
            case 3:
                System.out.println("""
                                            ¿Unas Salsas?
                        Opcion 1: (MAYOHUT 1OZ)               |                   ¡El match perfecto!                      |
                        Precio:   $1.50                       |        1 onza de salsa a base de moztaza y mayonesa.       |
                        
                        Opcion 2: (SALSA HONEY 1OZ)           |              ¡Combina con lo que quieras!                  |
                        Precio:   $1.50                       |        1 onza de salsa BBQ con toque de sabor a miel.      |
                        
                        Opcion 3: (SALSA CHILI THAI 1OZ)      |                   ¡Lo mejor de dos mundos!                 |
                        Precio:   $1.50                       |              1 onza de salsa dulce y picante.              |
                        
                        Opcion 4: (SALSA MEDITERRANEA 1OZ)    |                   ¡Para tus antojos!                       |
                        Precio:   $1.50                       |1 onza de salsa de tomate, finas hierbas y un toque picante.|
                        
                        Opcion 5: (SALSA AJI DE LA CASA 1OZ)  |                      ¡El toque perfecto!                   |
                        Precio:   $1.50                       |  1 onza aji hecho en casa para que dipees tu Hut favorita. |
                        
                        Opcion 6: Volver
                        """);
                int salsas = sc.nextInt();
                switch (salsas) {
                    case 1:
                        System.out.println("¿Cuantas MAYOHUT llevara?");
                        int cantidadMayohut = sc.nextInt();
                        double precioTotal = 1.50 * cantidadMayohut;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;
                        tipoPizza = "MAYOHUT 1OZ";
                        carrito.add(new Producto(tipoPizza, precioTotal, cantidadMayohut));
                        System.out.println("Añadido al carrito: " + cantidadMayohut + " x " + tipoPizza + " = " + precioTotal);

                        System.out.printf("Subtotal: %.2f%n", subtotal);
                        System.out.printf("IGV: %.2f%n", montoIGV);
                        System.out.printf("Precio Total: %.2f%n", precioTotal);
                        break;
                    case 2:
                        System.out.println("Cuantas SALSA HONEY llevara");
                        int cantidadSalsaHoney = sc.nextInt();
                        double precioTotalSH = 1.50 * cantidadSalsaHoney;
                        double subtotalSH = precioTotalSH / (1 + IGV);
                        double montoIGVSH = precioTotalSH - subtotalSH;
                        tipoPizza = "SALSA HONEY 1OZ";
                        carrito.add(new Producto(tipoPizza, precioTotalSH, cantidadSalsaHoney));
                        System.out.println("Añadido al carrito: " + cantidadSalsaHoney + " x " + tipoPizza + " = " + precioTotalSH);

                        System.out.printf("Subtotal: %.2f%n", subtotalSH);
                        System.out.printf("IGV: %.2f%n", montoIGVSH);
                        System.out.printf("Precio Total: %.2f%n", precioTotalSH);
                        break;
                    case 3:
                        System.out.println("Cuantas SALSA CHILI THAI llevara");
                        int cantidadSalsaChiliThai = sc.nextInt();
                        double precioTotalSCHT = 1.50 * cantidadSalsaChiliThai;
                        double subtotalSCHT = precioTotalSCHT / (1 + IGV);
                        double montoIGVSCHT = precioTotalSCHT - subtotalSCHT;
                        tipoPizza = "SALSA CHILI THAI 1OZ";
                        carrito.add(new Producto(tipoPizza, precioTotalSCHT, cantidadSalsaChiliThai));
                        System.out.println("Añadido al carrito: " + cantidadSalsaChiliThai + " x " + tipoPizza + " = " + precioTotalSCHT);

                        System.out.printf("Subtotal: %.2f%n", subtotalSCHT);
                        System.out.printf("IGV: %.2f%n", montoIGVSCHT);
                        System.out.printf("Precio Total: %.2f%n", precioTotalSCHT);
                        break;
                    case 4:
                        System.out.println("Cuantas SALSAS MEDITERRANEA llevara");
                        int cantidadChurros = sc.nextInt();
                        double precioTotalSM = 1.50 * cantidadChurros;
                        double subtotalSM = precioTotalSM / (1 + IGV);
                        double montoIGVSM = precioTotalSM - subtotalSM;
                        tipoPizza = "SALSA MEDITERRANEA 1OZ";
                        carrito.add(new Producto(tipoPizza, precioTotalSM, cantidadChurros));
                        System.out.println("Añadido al carrito: " + cantidadChurros + " x " + tipoPizza + " = " + precioTotalSM);

                        System.out.printf("IGV: %.2f%n", montoIGVSM);
                        System.out.printf("Subtotal: %.2f%n", subtotalSM);
                        System.out.printf("Precio Total: %.2f%n", precioTotalSM);
                        break;
                    case 5:
                        System.out.println("¿Cuantas SALSAS AJI DE LA CASA llevara?");
                        int cantidadChurrosSA = sc.nextInt();
                        double precioTotalSA = 1.50 * cantidadChurrosSA;
                        double subtotalSA = precioTotalSA / (1 + IGV);
                        double montoIGVSA = precioTotalSA - subtotalSA;
                        tipoPizza = "SALSA AJI DE LA CASA 1OZ";
                        carrito.add(new Producto(tipoPizza, precioTotalSA, cantidadChurrosSA));
                        System.out.println("Añadido al carrito: " + cantidadChurrosSA + " x " + tipoPizza + " = " + precioTotalSA);

                        System.out.printf("Subtotal: %.2f%n", subtotalSA);
                        System.out.printf("IGV: %.2f%n", montoIGVSA);
                        System.out.printf("Precio Total: %.2f%n", precioTotalSA);
                        break;
                    default:
                        System.out.println("");
                }
                break;
        }
    }

    public static void procesarBebidas() {
        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";

        System.out.println("\n" + GREEN + """
        ╔═══════════════════════════════════════════════════════════════════════════════════╗
        ║                  ⭐️ 🍹 BIENVENIDO A NUESTRA CARTA DE BEBIDAS 🍹 ⭐️                  ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

        System.out.println(YELLOW + """
        ║                 ¡Disfruta de nuestras refrescantes bebidas! ✨                     ║
        ╠═══════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

        System.out.println(RED + "║ Opcion 1:  (COCA COLA SIN AZUCAR)   | Para recojo de tienda se entregarán vasos ║");
        System.out.println("║ Precio:   - PERSONAL ($4.90)        |        de gaseosa según apliquen          ║");
        System.out.println("║           - 1 LITRO  ($8.90)        |                                        ║");
        System.out.println("╠═══════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(GREEN + "║ Opcion 2: (INCA KOLA SIN AZUCAR)    | Para recojo de tienda se entregarán vasos ║");
        System.out.println("║ Precio:   - PERSONAL  ($4.90)       |       de gaseosa según apliquen           ║");
        System.out.println("║           - 1 LITRO   ($8.90)       |                                        ║");
        System.out.println("╠═══════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(BLUE + "║ Opcion 3: (SPRITE PERSONAL)         | Para recojo de tienda se entregara 1 vaso ║");
        System.out.println("║ Precio:   ($4.90)                   |       de gaseosa según apliquen           ║");
        System.out.println("╠═══════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(PURPLE + "║ Opcion 4: (FANTA PERSONAL)          | Para recojo de tienda se entregara 1 vaso ║");
        System.out.println("║ Precio:   ($4.90)                   |       de gaseosa según apliquen           ║");
        System.out.println("╠═══════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(CYAN + "║ Opcion 5: (AGUA SAN LUIS SIN GAS)   |         Agua San Luis sin gas              ║");
        System.out.println("║ Precio:   ($4.90)                   |                                        ║");
        System.out.println("╠═══════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(RED + "║ Opcion 6: Volver                   | Regresar al menú anterior                 ║");
        System.out.println("╚═══════════════════════════════════════════════════════════════════════════════════╝");

        System.out.println(BLUE + "║              【0】 Volver al menú principal - ⬅️ Regresar                     ║");
        System.out.println(RED + """
        ╚═══════════════════════════════════════════════════════════════════════════════════╝
        """ + RESET);
        int bebidas = sc.nextInt();
        switch (bebidas) {
            case 1:
                System.out.println("   CUAL TAMAÑO DE GASEOSA COCA COLA SIN AZUCAR DESEA    ");
                System.out.println("               Opcion 1: PERSONAL ($4.90)               ");
                System.out.println("               Opcion 2: 1 LITRO  ($8.90)               ");
                int cantidadC = sc.nextInt();
                switch (cantidadC) {
                    case 1:
                        System.out.println("¿Cuantas unidades llevará?");
                        int cantidadPersonalesCC = sc.nextInt();
                        double precioTotalC = 4.90 * cantidadPersonalesCC;
                        double subtotalC = precioTotalC / (1 + IGV);
                        double montoIGVC = precioTotalC - subtotalC;
                        String tipoPizza = "COCA COLA SIN AZUCAR - PERSONAL";
                        carrito.add(new Producto(tipoPizza, precioTotalC, cantidadPersonalesCC));
                        System.out.println("Añadido al carrito: " + cantidadPersonalesCC + " x " + tipoPizza + " = " + precioTotalC);


                        System.out.printf("Subtotal: %.2f%n", subtotalC);
                        System.out.printf("IGV: %.2f%n", montoIGVC);
                        System.out.printf("Precio Total: %.2f%n", precioTotalC);
                        break;
                    case 2:
                        System.out.println("¿Cuantas unidades llevará?");
                        int cantidadPersonalesCCL = sc.nextInt();
                        double precioTotalCL = 8.90 * cantidadPersonalesCCL;
                        double subtotalCL = precioTotalCL / (1 + IGV);
                        double montoIGVCL = precioTotalCL - subtotalCL;
                        String tipoPizza2 = "COCA COLA SIN AZUCAR - 1 Litro";
                        carrito.add(new Producto(tipoPizza2, precioTotalCL, cantidadPersonalesCCL));
                        System.out.println("Añadido al carrito: " + cantidadPersonalesCCL + " x " + tipoPizza2 + " = " + precioTotalCL);

                        System.out.printf("Subtotal: %.2f%n", subtotalCL);
                        System.out.printf("IGV: %.2f%n", montoIGVCL);
                        System.out.printf("Precio Total: %.2f%n", precioTotalCL);
                        break;
                    default:
                        System.out.println("");
                }
                return;
            case 2:
                System.out.println("   CUAL TAMAÑO DE GASEOSA INKA KOLA SIN AZUCAR DESEA    ");
                System.out.println("              Opcion 1: PERSONAL ($4.90)                ");
                System.out.println("              Opcion 2: 1 LITRO  ($8.90)                ");
                int cantidadI = sc.nextInt();
                switch (cantidadI) {
                    case 1:
                        System.out.println("¿Cuantas unidades llevará?");
                        int cantidadPersonalesI = sc.nextInt();
                        double precioTotalI = 4.90 * cantidadPersonalesI;
                        double subtotalI = precioTotalI / (1 + IGV);
                        double montoIGVI = precioTotalI - subtotalI;
                        String tipoPizza3 = "INKA KOLA SIN AZUCAR - PERSONAL";
                        carrito.add(new Producto(tipoPizza3, precioTotalI, cantidadPersonalesI));
                        System.out.println("Añadido al carrito: " + cantidadPersonalesI + " x " + tipoPizza3 + " = " + precioTotalI);

                        System.out.printf("Subtotal: %.2f%n", subtotalI);
                        System.out.printf("IGV: %.2f%n", montoIGVI);
                        System.out.printf("Precio Total: %.2f%n", precioTotalI);
                        break;
                    case 2:
                        System.out.println("¿Cuantas unidades llevará?");
                        int cantidadPersonalesIL = sc.nextInt();
                        double precioTotalIL = 8.90 * cantidadPersonalesIL;
                        double subtotalIL = precioTotalIL / (1 + IGV);
                        double montoIGVIL = precioTotalIL - subtotalIL;
                        String tipoPizza4 = "INKA KOLA SIN AZUCAR - 1 Litro";
                        carrito.add(new Producto(tipoPizza4, precioTotalIL, cantidadPersonalesIL));
                        System.out.println("Añadido al carrito: " + cantidadPersonalesIL + " x " + tipoPizza4 + " = " + precioTotalIL);

                        System.out.printf("Subtotal: %.2f%n", subtotalIL);
                        System.out.printf("IGV: %.2f%n", montoIGVIL);
                        System.out.printf("Precio Total: %.2f%n", precioTotalIL);
                        break;
                    default:
                        System.out.println("");
                }
                return;
            case 3:
                System.out.println("¿Cuantas unidades llevará?");
                int cantidadPersonalesE = sc.nextInt();
                double precioTotalE = 4.90 * cantidadPersonalesE;
                double subtotalE = precioTotalE / (1 + IGV);
                double montoIGVE = precioTotalE - subtotalE;
                String tipoPizza5 = "SPRITE - PERSONAL";
                carrito.add(new Producto(tipoPizza5, precioTotalE, cantidadPersonalesE));
                System.out.println("Añadido al carrito: " + cantidadPersonalesE + " x " + tipoPizza5 + " = " + precioTotalE);

                System.out.printf("Subtotal: %.2f%n", subtotalE);
                System.out.printf("IGV: %.2f%n", montoIGVE);
                System.out.printf("Precio Total: %.2f%n", precioTotalE);
                break;
            case 4:
                System.out.println("¿Cuantos comprara llevará?");
                int cantidadPersonalesF = sc.nextInt();
                double precioTotalF = 4.90 * cantidadPersonalesF;
                double subtotalF = precioTotalF / (1 + IGV);
                double montoIGVF = precioTotalF - subtotalF;
                String tipoPizza6 = "FANTA - PERSONAL";
                carrito.add(new Producto(tipoPizza6, precioTotalF, cantidadPersonalesF));
                System.out.println("Añadido al carrito: " + cantidadPersonalesF + " x " + tipoPizza6 + " = " + precioTotalF);

                System.out.printf("Subtotal: %.2f%n", subtotalF);
                System.out.printf("IGV: %.2f%n", montoIGVF);
                System.out.printf("Precio Total: %.2f%n", precioTotalF);
                break;
            case 5:
                System.out.println("¿Cuantas botellas de agua llevará?");
                int cantidadPersonalesA = sc.nextInt();
                double precioTotalA = 4.90 * cantidadPersonalesA;
                double subtotalA = precioTotalA / (1 + IGV);
                double montoIGVA = precioTotalA - subtotalA;
                String tipoPizza7 = "AGUA SAN LUIS SIN GAS - PERSONAL";
                carrito.add(new Producto(tipoPizza7, precioTotalA, cantidadPersonalesA));
                System.out.println("Añadido al carrito: " + cantidadPersonalesA + " x " + tipoPizza7 + " = " + precioTotalA);

                System.out.printf("Subtotal: %.2f%n", subtotalA);
                System.out.printf("IGV: %.2f%n", montoIGVA);
                System.out.printf("Precio Total: %.2f%n", precioTotalA);
                break;
            default:
                System.out.println("");
        }
    }

    public static void procesarParaMi() {
        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";

        
        System.out.println("\n" + GREEN + """
        ╔═════════════════════════════════════════════════════════════════════════════════════╗
        ║               ⭐️ 🍕 ✨ BIENVENIDO A NUESTRA CARTA DE COMBOS  ✨ 🍕 ⭐️                ║
        ╠═════════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

        System.out.println(YELLOW + """
        ║                ¡Elige tu combo favorito y disfruta de una experiencia única! ✨       ║
        ╠═════════════════════════════════════════════════════════════════════════════════════╣""" + RESET);


        System.out.println(RED + "║ Opcion 1: (MY BOX CLASSICO)        | 1 Pizza Personal                                 ║");
        System.out.println("║ Precio: $14.90                     | 3 Palitos a la Siliciana                         ║");
        System.out.println("║                                    | 1 Bebida Personal                                ║");
        System.out.println("╠═════════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(GREEN + "║ Opcion 2: (MY BOX SUPREMO)         | Si tienes Hambre esta caja es tuya:              ║");
        System.out.println("║ Precio: $19.90                     | 1 Pizza Personal                                 ║");
        System.out.println("║                                    | 3 Alitas BBQ                                     ║");
        System.out.println("║                                    | 1 Bebida Personal                                ║");
        System.out.println("╠═════════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(BLUE + "║ Opcion 3: (DUO LASAGNA BOLOGNESA)  | ¡Tu favorita de Siempre!                         ║");
        System.out.println("║ Precio: $24.90                     | 1 Lasagna Bolognesa                              ║");
        System.out.println("║                                    | 1 Bebida Personal                                ║");
        System.out.println("╠═════════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(PURPLE + "║ Opcion 4: (MIERCOLES DE FALABELLA) | 1 Pizza Mediana (Americana, Pepperoni o Suprema) ║");
        System.out.println("║ Precio: $12.90                     | 1 Bebida Regular                                 ║");
        System.out.println("╠═════════════════════════════════════════════════════════════════════════════════════╣");

        System.out.println(CYAN + "║ Opcion 5: Volver                   | Regresar al menú anterior                        ║");
        System.out.println("╚═════════════════════════════════════════════════════════════════════════════════════╝");


        System.out.println(BLUE + "║              【0】 Volver al menú principal - ⬅️ Regresar                     ║");
        System.out.println(RED + """
        ╚═════════════════════════════════════════════════════════════════════════════════════╝
        """ + RESET);
        int combos = sc.nextInt();
        switch (combos) {
            case 1:
                System.out.println("¿Cuantos combos comprara?");
                int cantidadComboClassico = sc.nextInt();
                double precioTotalC = 14.90 * cantidadComboClassico;
                double subtotal = precioTotalC / (1 + IGV);
                double montoIGVC = precioTotalC - subtotal;
                String tipoPizza = "MY BOX CLASSICO";

                carrito.add(new Producto(tipoPizza, precioTotalC, cantidadComboClassico));
                System.out.println("Añadido al carrito: " + cantidadComboClassico + " x " + tipoPizza + " = " + precioTotalC);

                System.out.printf("Subtotal: %.2f%n", subtotal);
                System.out.printf("IGV: %.2f%n", montoIGVC);
                System.out.printf("Precio Total: %.2f%n", precioTotalC);
                break;
            case 2:
                System.out.println("¿Cuantos Combos Supremos comprara?");
                int cantidadComboSupremo = sc.nextInt();
                double precioTotalS = 19.90 * cantidadComboSupremo;
                double subtotalS = precioTotalS / (1 + IGV);
                double montoIGVS = precioTotalS - subtotalS;
                String tipoPizza1 = "MY BOX SUPREMO";
                carrito.add(new Producto(tipoPizza1, precioTotalS, cantidadComboSupremo));
                System.out.println("Añadido al carrito: " + cantidadComboSupremo + " x " + tipoPizza1 + " = " + precioTotalS);

                System.out.printf("Subtotal: %.2f%n", subtotalS);
                System.out.printf("IGV: %.2f%n", montoIGVS);
                System.out.printf("Precio Total: %.2f%n", precioTotalS);
                break;
            case 3:
                System.out.println("¿Cuantos Duos Lasagna comprara?");
                int cantidadDuoLasagna = sc.nextInt();
                double precioTotaL = 24.90 * cantidadDuoLasagna;
                double subtotalD = precioTotaL / (1 + IGV);
                double montoIGV = precioTotaL - subtotalD;
                String tipoPizza2 = "DUO LASAGNA BOLOGNESA";

                carrito.add(new Producto(tipoPizza2, precioTotaL, cantidadDuoLasagna));
                System.out.println("Añadido al carrito: " + cantidadDuoLasagna + " x " + tipoPizza2 + " = " + precioTotaL);

                System.out.printf("Subtotal: %.2f%n", subtotalD);
                System.out.printf("IGV: %.2f%n", montoIGV);
                System.out.printf("Precio Total: %.2f%n", precioTotaL);
                break;
            case 4:
                System.out.println("¿Cuantos Falabella comprara?");
                int cantidadFalabella = sc.nextInt();
                double precioTotal = 12.90 * cantidadFalabella;
                double subtotalF = precioTotal / (1 + IGV);
                double montoIGVF = precioTotal - subtotalF;
                String tipoPizza4 = "MIERCOLES DE FALABELLA";

                carrito.add(new Producto(tipoPizza4, precioTotal, cantidadFalabella));
                System.out.println("Añadido al carrito: " + cantidadFalabella + " x " + tipoPizza4 + " = " + precioTotal);

                System.out.printf("Subtotal: %.2f%n", subtotalF);
                System.out.printf("IGV: %.2f%n", montoIGVF);
                System.out.printf("Precio Total: %.2f%n", precioTotal);
                break;
            default:
                System.out.println("");
        }
    }

    public static void procesarOfertas() {

        int opcion;
        String tipoPizza;
        do {
            final String RESET = "\u001B[0m";
            final String RED = "\u001B[31m";
            final String GREEN = "\u001B[32m";
            final String BLUE = "\u001B[34m";
            final String PURPLE = "\u001B[35m";
            final String CYAN = "\u001B[36m";



            System.out.println("\n" + GREEN + """
        ╔════════════════════════════════════════════════════════════════════════════════════════════════════════╗
        ║                             ⭐️ BIENVENIDO A NUESTRA CARTA ⭐️                                           ║
        ╠════════════════════════════════════════════════════════════════════════════════════════════════════════╣
        ║                                     || ofertas ||                                                      ║
        ║                            SELECCIONE LA OPCION QUE MAS LE GUSTE                                       ║
        ╠════════════════════════════════════════════════════════════════════════════════════════════════════════╣""" + RESET);

            System.out.println(RED + """
                     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |              1                  |                 2                 |                  3                |
                    |        2X1 PIZZAS MEDIANAS      |           COMBO MEDIANO           |               LA FIJA             |
                    |                                 |                                   |                                   |
                    | ¡Ahorra 50% y disfruta por      | ¡Cuando quieres algo para ti      | Armala de la forma que prefieras  |
                    | partida doble!                  | solito!                           | y con ingredientes que mas te     |
                    |                                 | 1Pizza Mediana y 1Bebida Personal | guste.                            |
                    |                                 |                                   |                                   |
                    |                  desde S/20.90  |                   desde S/21.90   |                  desde S/19.90    |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

            System.out.println(GREEN + """
        
                     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |               4                 |                5                  |                 6                 |
                    |         BANQUETE GRANDE         |         BANQUETE FAMILIAR         |        COMBO MEDIANO 4 EN 1       |
                    |                                 |                                   |                                   |
                    | ¡Una verdadera gran promo! 1    | ¡La que unira mas a tu familia!   | 4 HITS en 1 mediana               |
                    | Pizza G.6 Palitos a la Siciliana| Para toda tu familia 1 Pizza Fami | ¡4 sabores en 1 pizza!1 Pizza me  |
                    | y 1 Bebida de 1L.               | liar, 6Palitos a la Siciliana y 1 | diana +1 gaseoasa personal        |
                    |                                 | Bebida 1L                         |                                   |
                    |                  desde S/39.90  |                desde S/49.90      |                  desde S/24.90    |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

            System.out.println(BLUE + """
        
                     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |                7                |                 8                 |                  9                |
                    |        COMBO GRANDE 4 EN 1      |       COMBO FANILIAR 4 EN 1       | COMBO FAMILIAR HUT CHEESE 4 EN 1  |
                    |                                 |                                   |                                   |
                    | 4HITS en 1 grande.              | 4HITS en 1 familiar.              | 4HITS en 1 familiar HCH           |
                    | ¡4 sabores en 1 pizza! 1 Pizza  | ¡4 sabores en pizza! 1 Pizza      | ¡4 sabores en 1 pizza! 1 Pizza    |
                    | grande + 1 gaseosa 1 litro      | familiar +1 gaseosa 1 litro       | familiar HCH +1 gaseosa 1 litro   |
                    |                                 |                                   |                                   |
                    |                  desde S/34.90  |                   desde S/44.90   |                  desde S/50.90    |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

            System.out.println(PURPLE + """
                      _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |                10               |                11                 |                12                 |
                    |         HUT COMBO MEDIANO       |           COMBO LA FIJA           |        HUT CHEESE MEDIANO         |
                    |                                 |                                   |                                   |
                    | ¡Date un gusto! 1 Pizza mediana | 1 Pizza Grande con 1              | 1 Pizza mediano hut cheese        |
                    | 4 palitos a la Siciliana y 1    | ingrediente adicional +1 Bebida   |                                   |
                    | bebida Personal                 | 1L.                               |                                   |
                    |                                 |                                   |                                   |
                    |                  desde S/24.90  |                   desde S/24.90   |                  desde S/26.90    |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

            System.out.println(CYAN + """
                      _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |                13               |               14                  |                 15                |
                    |     PIZZA GRANDE HUT CHEESE     |      BANQUETE GRANDE HUT CHEESE   |         COMBO CHEESY BITES        |
                    |                                 |                                   |                                   |
                    | ¡Para los amantes del queso!    | ¡Full bordes!                     | ¡28BITES! 1Pizza cheesy bites     |
                    | 1 Pizza Grande Hut Cheese.      | 1 Pizza grande hut cheese, 6 pali | Familiar sabor a eleccion +1      |
                    |                                 | tos a la Siciliana y 1 bebida 1L  | Bebida de 1L.                     |
                    |                                 |                                   |                                   |
                    |                  desde S/32.90  |                   desde S/45.90   |                  desde S/49.90    |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

            System.out.println(RED + """
                      _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _                                     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                    |                16               |                                   |                  17               |
                    |          COMBO PIZZA XL         |                                   |        COMBO TRIPACK FAMILIAR     |
                    |                                 |                                   |                                   |
                    | La mas grande con 4 sabores 1   |                                   | ¡Tiene todo! 3 Pizzas Fam         |
                    | Pizza XL Clasica y 1 gaseosa 1L |                                   | 10 palitos a la Siciliana y 2 ga  |
                    |                                 |                                   |  seosa de 1L                      |
                    |                                 |                                   |                                   |
                    |                  desde S/69.90  |                                   |                  desde S/112.90   |
                    |                                 |                                   |                                   |
                     - - - - - - - - -  - - - - - - - -                                   |  - - - - - - - - -  - - - - - - - - """ + RESET);
            System.out.println("------------------------------------------------------------------------------------------------------------");
            System.out.print("Opcion:");
            opcion = sc.nextInt();
            switch (opcion) {

                case 1:
                    int cantidad1;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad1 = sc.nextInt();
                        if (cantidad1 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad1 < 0);

                    double precioTotal1 = 49.90 * cantidad1;
                    double subtotal1 = precioTotal1 / (1 + IGV);
                    double montoIGV1 = precioTotal1 - subtotal1;
                    System.out.printf("Subtotal: %.2f%n", subtotal1);
                    System.out.printf("IGV: %.2f%n", montoIGV1);
                    System.out.printf("Precio Total: %.2f%n", precioTotal1);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    2X1 PIZZAS MEDIANAS");

                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    tipoPizza = "2X1 PIZZAS MEDIANAS";
                    carrito.add(new Producto(tipoPizza, precioTotal1, cantidad1));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad1 + " x " + tipoPizza + " = " + precioTotal1);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    break;
                case 2:
                    int cantidad2;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad2 = sc.nextInt();
                        if (cantidad2 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad2 < 0);

                    double precioTotal2 = 49.90 * cantidad2;
                    double subtotal2 = precioTotal2 / (1 + IGV);
                    double montoIGV2 = precioTotal2 - subtotal2;
                    System.out.printf("Subtotal: %.2f%n", subtotal2);
                    System.out.printf("IGV: %.2f%n", montoIGV2);
                    System.out.printf("Precio Total: %.2f%n", precioTotal2);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                               USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       COMBO MEDIANO");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO MEDIANO";
                    carrito.add(new Producto(tipoPizza, precioTotal2, cantidad2));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad2 + " x " + tipoPizza + " = " + precioTotal2);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 3:
                    int cantidad3;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad3 = sc.nextInt();
                        if (cantidad3 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad3 < 0);

                    double precioTotal = 49.90 * cantidad3;
                    double subtotal = precioTotal / (1 + IGV);
                    double montoIGV = precioTotal - subtotal;
                    System.out.printf("Subtotal: %.2f%n", subtotal);
                    System.out.printf("IGV: %.2f%n", montoIGV);
                    System.out.printf("Precio Total: %.2f%n", precioTotal);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                             USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                         LA FIJA");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    tipoPizza = "LA FIJA";
                    carrito.add(new Producto(tipoPizza, precioTotal, cantidad3));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad3 + " x " + tipoPizza + " = " + precioTotal);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 4:
                    int cantidad4;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad4 = sc.nextInt();
                        if (cantidad4 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad4 < 0);

                    double precioTotal4 = 49.90 * cantidad4;
                    double subtotal4 = precioTotal4 / (1 + IGV);
                    double montoIGV4 = precioTotal4 - subtotal4;
                    System.out.printf("Subtotal: %.2f%n", subtotal4);
                    System.out.printf("IGV: %.2f%n", montoIGV4);
                    System.out.printf("Precio Total: %.2f%n", precioTotal4);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                      BANQUETE GRANDE");
                    System.out.println("------------------------------------------------------------------------------------------------------------");
                    tipoPizza = "BANQUETE GRANDE";
                    carrito.add(new Producto(tipoPizza, precioTotal4, cantidad4));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad4 + " x " + tipoPizza + " = " + precioTotal4);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 5:
                    int cantidad5;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad5 = sc.nextInt();
                        if (cantidad5 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad5 < 0);

                    double precioTotal5 = 49.90 * cantidad5;
                    double subtotal5 = precioTotal5 / (1 + IGV);
                    double montoIGV5 = precioTotal5 - subtotal5;
                    System.out.printf("Subtotal: %.2f%n", subtotal5);
                    System.out.printf("IGV: %.2f%n", montoIGV5);
                    System.out.printf("Precio Total: %.2f%n", precioTotal5);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                     BANQUETE FAMILIAR ");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    tipoPizza = "BANQUETE FAMILIAR";
                    carrito.add(new Producto(tipoPizza, precioTotal5, cantidad5));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad5 + " x " + tipoPizza + " = " + precioTotal5);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 6:
                    int cantidad6;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad6 = sc.nextInt();
                        if (cantidad6 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad6 < 0);

                    double precioTotal6 = 49.90 * cantidad6;
                    double subtotal6 = precioTotal6 / (1 + IGV);
                    double montoIGV6 = precioTotal6 - subtotal6;
                    System.out.printf("Subtotal: %.2f%n", subtotal6);
                    System.out.printf("IGV: %.2f%n", montoIGV6);
                    System.out.printf("Precio Total: %.2f%n", precioTotal6);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   COMBO MEDIANO 4 EN 1");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO MEDIANO 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal6, cantidad6));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad6 + " x " + tipoPizza + " = " + precioTotal6);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 7:
                    int cantidad7;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad7 = sc.nextInt();
                        if (cantidad7 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad7 < 0);

                    double precioTotal7 = 49.90 * cantidad7;
                    double subtotal7 = precioTotal7 / (1 + IGV);
                    double montoIGV7 = precioTotal7 - subtotal7;
                    System.out.printf("Subtotal: %.2f%n", subtotal7);
                    System.out.printf("IGV: %.2f%n", montoIGV7);
                    System.out.printf("Precio Total: %.2f%n", precioTotal7);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO GRANDE 4 EN 1");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO GRANDE 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal7, cantidad7));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad7 + " x " + tipoPizza + " = " + precioTotal7);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 8:
                    int cantidad8;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad8 = sc.nextInt();
                        if (cantidad8 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad8 < 0);

                    double precioTotal8 = 49.90 * cantidad8;
                    double subtotal8 = precioTotal8 / (1 + IGV);
                    double montoIGV8 = precioTotal8 - subtotal8;
                    System.out.printf("Subtotal: %.2f%n", subtotal8);
                    System.out.printf("IGV: %.2f%n", montoIGV8);
                    System.out.printf("Precio Total: %.2f%n", precioTotal8);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO/");
                    System.out.println("                                    COMBO FAMILIAR 4 EN 1");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO FAMILIAR 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal8, cantidad8));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad8 + " x " + tipoPizza + " = " + precioTotal8);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 9:
                    int cantidad9;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad9 = sc.nextInt();
                        if (cantidad9 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad9 < 0);

                    double precioTotal9 = 49.90 * cantidad9;
                    double subtotal9 = precioTotal9 / (1 + IGV);
                    double montoIGV9 = precioTotal9 - subtotal9;
                    System.out.printf("Subtotal: %.2f%n", subtotal9);
                    System.out.printf("IGV: %.2f%n", montoIGV9);
                    System.out.printf("Precio Total: %.2f%n", precioTotal9);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                              COMOBO FAMILIAR HUT CHEESE 4 EN 1");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMOBO FAMILIAR HUT CHEESE 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal9, cantidad9));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad9 + " x " + tipoPizza + " = " + precioTotal9);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 10:
                    int cantidad10;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad10 = sc.nextInt();
                        if (cantidad10 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad10 < 0);

                    double precioTotal10 = 49.90 * cantidad10;
                    double subtotal10 = precioTotal10 / (1 + IGV);
                    double montoIGV10 = precioTotal10 - subtotal10;
                    System.out.printf("Subtotal: %.2f%n", subtotal10);
                    System.out.printf("IGV: %.2f%n", montoIGV10);
                    System.out.printf("Precio Total: %.2f%n", precioTotal10);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                   USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       HUT COMBO MEDIANO");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "HUT COMBO MEDIANO";
                    carrito.add(new Producto(tipoPizza, precioTotal10, cantidad10));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad10 + " x " + tipoPizza + " = " + precioTotal10);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 11:
                    int cantidad11;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad11 = sc.nextInt();
                        if (cantidad11 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad11 < 0);

                    double precioTotal11 = 49.90 * cantidad11;
                    double subtotal11 = precioTotal11 / (1 + IGV);
                    double montoIGV11 = precioTotal11 - subtotal11;
                    System.out.printf("Subtotal: %.2f%n", subtotal11);
                    System.out.printf("IGV: %.2f%n", montoIGV11);
                    System.out.printf("Precio Total: %.2f%n", precioTotal11);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                        COMBO LA FIJA");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO LA FIJA";
                    carrito.add(new Producto(tipoPizza, precioTotal11, cantidad11));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad11 + " x " + tipoPizza + " = " + precioTotal11);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 12:
                    int cantidad12;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad12 = sc.nextInt();
                        if (cantidad12 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad12 < 0);

                    double precioTotal12 = 49.90 * cantidad12;
                    double subtotal12 = precioTotal12 / (1 + IGV);
                    double montoIGV12 = precioTotal12 - subtotal12;
                    System.out.printf("Subtotal: %.2f%n", subtotal12);
                    System.out.printf("IGV: %.2f%n", montoIGV12);
                    System.out.printf("Precio Total: %.2f%n", precioTotal12);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                  USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       HUT CHEESE MEDIANO");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "HUT CHEESE MEDIANO";
                    carrito.add(new Producto(tipoPizza, precioTotal12, cantidad12));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad12 + " x " + tipoPizza + " = " + precioTotal12);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 13:
                    int cantidad13;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad13 = sc.nextInt();
                        if (cantidad13 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad13 < 0);

                    double precioTotal13 = 49.90 * cantidad13;
                    double subtotal13 = precioTotal13 / (1 + IGV);
                    double montoIGV13 = precioTotal13 - subtotal13;
                    System.out.printf("Subtotal: %.2f%n", subtotal13);
                    System.out.printf("IGV: %.2f%n", montoIGV13);
                    System.out.printf("Precio Total: %.2f%n", precioTotal13);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   PIZZA GRANDE HUT CHEESE");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "PIZZA GRANDE HUT CHEESE";
                    carrito.add(new Producto(tipoPizza, precioTotal13, cantidad13));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad13 + " x " + tipoPizza + " = " + precioTotal13);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 14:
                    int cantidad14;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad14 = sc.nextInt();
                        if (cantidad14 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad14 < 0);

                    double precioTotal14 = 49.90 * cantidad14;
                    double subtotal14 = precioTotal14 / (1 + IGV);
                    double montoIGV14 = precioTotal14 - subtotal14;
                    System.out.printf("Subtotal: %.2f%n", subtotal14);
                    System.out.printf("IGV: %.2f%n", montoIGV14);
                    System.out.printf("Precio Total: %.2f%n", precioTotal14);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                  BANQUETE GRANDE HUT CHEESE");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "BANQUETE GRANDE HUT CHEESE";
                    carrito.add(new Producto(tipoPizza, precioTotal14, cantidad14));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad14 + " x " + tipoPizza + " = " + precioTotal14);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 15:
                    int cantidad15;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad15 = sc.nextInt();
                        if (cantidad15 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad15 < 0);

                    double precioTotal15 = 49.90 * cantidad15;
                    double subtotal15 = precioTotal15 / (1 + IGV);
                    double montoIGV15 = precioTotal15 - subtotal15;
                    System.out.printf("Subtotal: %.2f%n", subtotal15);
                    System.out.printf("IGV: %.2f%n", montoIGV15);
                    System.out.printf("Precio Total: %.2f%n", precioTotal15);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO CHEESY Y BITES");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO CHEESY Y BITES";
                    carrito.add(new Producto(tipoPizza, precioTotal15, cantidad15));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad15 + " x " + tipoPizza + " = " + precioTotal15);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 16:
                    int cantidad16;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad16 = sc.nextInt();
                        if (cantidad16 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad16 < 0);

                    double precioTotal16 = 49.90 * cantidad16;
                    double subtotal16 = precioTotal16 / (1 + IGV);
                    double montoIGV16 = precioTotal16 - subtotal16;
                    System.out.printf("Subtotal: %.2f%n", subtotal16);
                    System.out.printf("IGV: %.2f%n", montoIGV16);
                    System.out.printf("Precio Total: %.2f%n", precioTotal16);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       COMBO PIZZA XL");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO PIZZA XL";
                    carrito.add(new Producto(tipoPizza, precioTotal16, cantidad16));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad16 + " x " + tipoPizza + " = " + precioTotal16);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 17:
                    int cantidad17;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad17 = sc.nextInt();
                        if (cantidad17 < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad17 < 0);

                    double precioTotal17 = 49.90 * cantidad17;
                    double subtotal17 = precioTotal17 / (1 + IGV);
                    double montoIGV17 = precioTotal17 - subtotal17;
                    System.out.printf("Subtotal: %.2f%n", subtotal17);
                    System.out.printf("IGV: %.2f%n", montoIGV17);
                    System.out.printf("Precio Total: %.2f%n", precioTotal17);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                   USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO TRIPACK FAMILIAT");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    tipoPizza = "COMBO TRIPACK FAMILIAT";
                    carrito.add(new Producto(tipoPizza, precioTotal17, cantidad17));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad17 + " x " + tipoPizza + " = " + precioTotal17);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                default:
                    System.out.println("❌❌❌❌❌❌Opcion no valida❌❌❌❌❌❌");


            }
        } while (opcion < 1 || opcion > 17);


    }

    public static void SolucionIGV(double precio) {
        int cantidad;

        do {


            System.out.println("----------------------------------------------------------------------------------------------");
            System.out.println("                               INGRESE LA CANTIDAD");
            cantidad = sc.nextInt();
            if (cantidad < 0) {
                System.out.println("La cantidad debe ser mayor a 0");
            }
        } while (cantidad < 0);

        double precioTotal = precio * cantidad;
        double subtotal = precioTotal / (1 + IGV);
        double montoIGV = precioTotal - subtotal;


        System.out.println("Subtotal: " + subtotal);
        System.out.println("IGV: " + montoIGV);
        System.out.println("Precio Total: " + precioTotal);


        total += precioTotal;


    }

    public static void procesarCombosHuts() {
        final String RESET = "\u001B[0m";
        final String RED = "\u001B[31m";
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        


        System.out.println(PURPLE + "╔═🌸══════════════════════════════════════════════════════════🌸═══╗" + RESET);
        System.out.println(RED + "║            ♡ ⋆｡ ° ✮ MENÚ DE COMBOS HUTS ✮ ° ｡⋆ ♡                " + PURPLE + "║" + RESET);
        System.out.println(YELLOW + "║                     ・。✧♡✧。・゜゜・。                            " + PURPLE + "║" + RESET);
        System.out.println(BLUE + "╠════════════════════•✧✧•════════════════════════════════════════╣" + RESET);
        System.out.println(GREEN + "║  1. ✿ Hut Days ..................................... $ 49.90   ║" + RESET);
        System.out.println(RED + "║  2. ✿ Hut Days Doble ............................... $ 39.90   ║" + RESET);
        System.out.println(YELLOW + "║  3. ✿ Doble o Nada Hut Cheese ...................... $ 79.90   ║" + RESET);
        System.out.println(BLUE + "║  4. ✿ Tripack Grande Hut Cheese .................... $ 94.90   ║" + RESET);
        System.out.println(GREEN + "║  5. ✿ Combo Doble o Nada Grande .................... $ 59.90   ║" + RESET);
        System.out.println(RED + "║  6. ✿ Combo Semi Full Grande ....................... $ 59.90   ║" + RESET);
        System.out.println(YELLOW + "║  7. ✿ Banquete Familiar Hut Cheese ................. $ 55.90   ║" + RESET);
        System.out.println(BLUE + "║  8. ✿ Tripack Familiar ............................. $ 99.90   ║" + RESET);
        System.out.println(GREEN + "║  9. ✿ Tripack Grande ............................... $ 79.90   ║" + RESET);
        System.out.println(RED + "║ 10. ✿ Combo Tripack Grande Hut Cheese .............. $ 99.90   ║" + RESET);
        System.out.println(YELLOW + "║ 11. ✿ Combo Semi Full Familiar ..................... $ 79.90   ║" + RESET);
        System.out.println(BLUE + "║ 12. ✿ Combo Semi Full Familiar Hut Cheese .......... $ 89.90   ║" + RESET);
        System.out.println(GREEN + "║ 13. ✿ Combo Doble o Nada Familiar .................. $ 82.90   ║" + RESET);
        System.out.println(RED + "║ 14. ✿ Combo Doble o Nada Familiar Hut Cheese ....... $ 92.90   ║" + RESET);
        System.out.println(PURPLE + "╠════════════════════•✧✧•════════════════════════════════════════╣" + RESET);
        System.out.println(YELLOW + "║          ♡ Gracias por preferir nuestros combos ♡              " + PURPLE + "║" + RESET);
        System.out.println(PURPLE + "╚═🌸══════════════════════════════════════════════════════════🌸═══╝" + RESET);

        System.out.print(GREEN + "Seleccione una opción: " + RESET);
        int opcion = sc.nextInt();
        sc.nextLine();

        System.out.println("------------------------------------------------------------------------");

        System.out.print("¿Cuántos combos desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();

        System.out.println("------------------------------------------------------------------------");

        double precio = 0;
        String tipoCombo = "";

        switch (opcion) {
            case 1:
                precio = 49.90;
                tipoCombo = "Hut Days";
                break;
            case 2:
                precio = 39.90;
                tipoCombo = "Hut Days Doble";
                break;
            case 3:
                precio = 79.90;
                tipoCombo = "Doble o Nada Hut Cheese";
                break;
            case 4:
                precio = 94.90;
                tipoCombo = "Tripack Grande Hut Cheese";
                break;
            case 5:
                precio = 59.90;
                tipoCombo = "Combo Doble o Nada Grande";
                break;
            case 6:
                precio = 59.90;
                tipoCombo = "Combo Semi Full Grande";
                break;
            case 7:
                precio = 55.90;
                tipoCombo = "Banquete Familiar Hut Cheese";
                break;
            case 8:
                precio = 99.90;
                tipoCombo = "Tripack Familiar";
                break;
            case 9:
                precio = 79.90;
                tipoCombo = "Tripack Grande";
                break;
            case 10:
                precio = 99.90;
                tipoCombo = "Combo Tripack Grande Hut Cheese";
                break;
            case 11:
                precio = 79.90;
                tipoCombo = "Combo Semi Full Familiar";
                break;
            case 12:
                precio = 89.90;
                tipoCombo = "Combo Semi Full Familiar Hut Cheese";
                break;
            case 13:
                precio = 82.90;
                tipoCombo = "Combo Doble o Nada Familiar";
                break;
            case 14:
                precio = 92.90;
                tipoCombo = "Combo Doble o Nada Familiar Hut Cheese";
                break;
            default:
                System.out.println("Opción inválida.");
                return;
        }
        double precioTotal = precio * cantidad;
        double subtotal = Math.round((precioTotal / (1 + IGV)) * 100.0) / 100.0;
        double montoIGV = Math.round((precioTotal - subtotal) * 100.0) / 100.0;

        carrito.add(new Producto(tipoCombo, precio, cantidad));
        System.out.println("Añadido al carrito: " + cantidad + " x " + tipoCombo + " = " + precioTotal);

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarLasMasHuts() {
        int opcion;
        do {

            final String RESET = "\u001B[0m";
            final String RED = "\u001B[31m";
            final String GREEN = "\u001B[32m";
            final String YELLOW = "\u001B[33m";



            System.out.println("\n" + GREEN + """
            System.out.println("---------------------------------------------------------------------------------------------------");
            System.out.println("                             BIENVENIDO A NUESTRA CARTA |||las mas huts|||");
            System.out.println("                                 SELECCIONE LA OPCION QUE MAS LE GUSTE");
            System.out.println("---------------------------------------------------------------------------------------------------");
            System.out.println( """ + RESET);

            System.out.println(RED + """
             _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
            |              1                  |               2                   |                 3                 |
            |    COMBO PILSEN GRANDE 4 EN 1   |   COMBO PILSEN FAMILIAR 4 EN 1    | COMBO PILSEN FAMILIAR HUT CHEESE  |
            |                                 |                                   |             4 EN 1                |
            | ¡El combo de los patas!1 pizza  | ¡El duo perfecto!1 pizza familiar |                                   |
            | grande +1 sixpack Pilsen Callao | +1 sixpack Pilsen Callao.         | ¡El duo perfecto!1 pizza familiar |
            | Para +18 años.                  | Para +18 años.                    | HCH+ 1sixpack Pilsen Callao.      |
            |                                 |                                   | Para +18 años.                    |
            |                  desde S/49.90  |                desde S/59.90      |                  desde S/65.90    |
            |                                 |                                   |                                   |
             - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

           System.out.println(GREEN + """
               _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
            |               4                 |                5                  |                6                  |
            |       HUT COMPLETO MEDIANO      |        DOBLE O NADA GRANDE        |        4 HITS EN 1 GRANDE         |
            |                                 |                                   |                                   |
            | ¡Para que no te falte nada! 2   | ¡El doble para compartir!2 pizzas | ¡Tus sabores favoritos juntos!    |
            | Pizzas M,6 Palitos a la Sicilia | Grandes a un precio especial      | Incluye Americana,Peperoni,Supre  |
            | na y Bebida de 1 L              |                                   | ma y Hawaina.                     |
            |                                 |                                   |                                   |
            |                  desde S/42.90  |                desde S/49.90      |                  desde S/29.90    |
            |                                 |                                   |                                   |
             - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - - """ + RESET);

             System.out.println(YELLOW  + """
                                                _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
                                              |                7                  |
                                              |       DOBLE O NADA FAMILIAR       |
                                              |                                   |
                                              | Para cuando hay mucha hambre 2    |
                                              | Pizzas Fam, a un precio especial  |
                                              |                                   |
                                              |                                   |
                                              |                  desde S/72.90    |
                                              |                                   |
                                              - - - - - - - - - -  - - - - - - - - - """ + RESET);

            System.out.println("--------------------------------------------------------------------------------------------------------");
            System.out.print("Opcion:");

            opcion = sc.nextInt();
            String tipoPizza;

            switch (opcion) {
                case 1:
                    int cantidad;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad = sc.nextInt();
                        if (cantidad < 0) {
                            System.out.println("La cantidad debe ser mayor a 0");
                        }
                    } while (cantidad < 0);

                    double precioTotal = 49.90 * cantidad;
                    double subtotal = precioTotal / (1 + IGV);
                    double montoIGV = precioTotal - subtotal;
                    System.out.printf("Subtotal: %.2f%n", subtotal);
                    System.out.printf("IGV: %.2f%n", montoIGV);
                    System.out.printf("Precio Total: %.2f%n", precioTotal);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                               USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                 COMBO PILSEN GRANDE 4 EN 1");
                    tipoPizza = "COMBO PILSEN GRANDE 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal, cantidad));
                    System.out.println("--------------------------------------------------------------------------------------------------------");
                    System.out.println("Añadido al carrito: " + cantidad + " x " + tipoPizza + " = " + precioTotal);
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    total += precioTotal;

                    break;
                case 2:
                    int cantidad1;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad1 = sc.nextInt();
                        if (cantidad1 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad1 < 0);

                    double precioTotal1 = 59.90 * cantidad1;
                    double subtotal1 = precioTotal1 / (1 + IGV);
                    double montoIGV1 = precioTotal1 - subtotal1;

                    System.out.printf("Subtotal: %.2f%n", subtotal1);
                    System.out.printf("IGV: %.2f%n", montoIGV1);
                    System.out.printf("Precio Total: %.2f%n", precioTotal1);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                 COMBO PILSEN FAMILIAR 4 EN 1");
                    tipoPizza = "COMBO PILSEN FAMILIAR 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal1, cantidad1));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad1 + " x " + tipoPizza + " = " + precioTotal1);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal1;


                    break;
                case 3:
                    int cantidad2;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad2 = sc.nextInt();
                        if (cantidad2 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad2 < 0);

                    double precioTotal2 = 65.90 * cantidad2;
                    double subtotal2 = precioTotal2 / (1 + IGV);
                    double montoIGV2 = precioTotal2 - subtotal2;

                    System.out.printf("Subtotal: %.2f%n", subtotal2);
                    System.out.printf("IGV: %.2f%n", montoIGV2);
                    System.out.printf("Precio Total: %.2f%n", precioTotal2);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                          COMBO PILSEN FAMILIAR HUT CHEESE 4 EN 1");
                    tipoPizza = "COMBO PILSEN FAMILIAR HUT CHEESE 4 EN 1";
                    carrito.add(new Producto(tipoPizza, precioTotal2, cantidad2));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad2 + " x " + tipoPizza + " = " + precioTotal2);
                    total += precioTotal2;
                    System.out.println("-----------------------------------------------------------------------------------------------");
                    break;
                case 4:
                    int cantidad3;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad3 = sc.nextInt();
                        if (cantidad3 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad3 < 0);

                    double precioTotal3 = 42.90 * cantidad3;
                    double subtotal3 = precioTotal3 / (1 + IGV);
                    double montoIGV3 = precioTotal3 - subtotal3;

                    System.out.printf("Subtotal: %.2f%n", subtotal3);
                    System.out.printf("IGV: %.2f%n", montoIGV3);
                    System.out.printf("Precio Total: %.2f%n", precioTotal3);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    HUT COMPLETO MEDIANO");
                    tipoPizza = "HUT COMPLETO MEDIANO";
                    carrito.add(new Producto(tipoPizza, precioTotal3, cantidad3));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad3 + " x " + tipoPizza + " = " + precioTotal3);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal3;
                    break;
                case 5:
                    int cantidad4;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad4 = sc.nextInt();
                        if (cantidad4 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad4 < 0);

                    double precioTotal4 = 49.90 * cantidad4;
                    double subtotal4 = precioTotal4 / (1 + IGV);
                    double montoIGV4 = precioTotal4 - subtotal4;

                    System.out.printf("Subtotal: %.2f%n", subtotal4);
                    System.out.printf("IGV: %.2f%n", montoIGV4);
                    System.out.printf("Precio Total: %.2f%n", precioTotal4);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    DOBLE O NADA GRANDE");
                    tipoPizza = "DOBLE O NADA GRANDE";
                    carrito.add(new Producto(tipoPizza, precioTotal4, cantidad4));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad4 + " x " + tipoPizza + " = " + precioTotal4);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal4;

                    break;
                case 6:
                    int cantidad5;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad5 = sc.nextInt();
                        if (cantidad5 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad5 < 0);

                    double precioTotal5 = 29.90 * cantidad5;
                    double subtotal5 = precioTotal5 / (1 + IGV);
                    double montoIGV5 = precioTotal5 - subtotal5;

                    System.out.printf("Subtotal: %.2f%n", subtotal5);
                    System.out.printf("IGV: %.2f%n", montoIGV5);
                    System.out.printf("Precio Total: %.2f%n", precioTotal5);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    4 HITS EN 1 GRANDE");
                    tipoPizza = "4 HITS EN 1 GRANDE";
                    carrito.add(new Producto(tipoPizza, precioTotal5, cantidad5));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad5 + " x " + tipoPizza + " = " + precioTotal5);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal5;

                    break;
                case 7:
                    int cantidad6;
                    do {
                        System.out.println("----------------------------------------------------------------------------------------------");
                        System.out.println("                               INGRESE LA CANTIDAD");
                        cantidad6 = sc.nextInt();
                        if (cantidad6 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    } while (cantidad6 < 0);


                    double precioTotal6 = 72.90 * cantidad6;
                    double subtotal6 = precioTotal6 / (1 + IGV);
                    double montoIGV6 = precioTotal6 - subtotal6;
                    System.out.println("------------------------------------------------------------------------------------------------");
                    System.out.printf("Subtotal: %.2f%n", subtotal6);
                    System.out.printf("IGV: %.2f%n", montoIGV6);
                    System.out.printf("Precio Total: %.2f%n", precioTotal6);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   DOBLE O NADA FAMILIAR");
                    tipoPizza = "DOBLE O NADA FAMILIAR";
                    carrito.add(new Producto(tipoPizza, precioTotal6, cantidad6));
                    System.out.println("--------------------------------------------------------------------------------------------------------");

                    System.out.println("Añadido al carrito: " + cantidad6 + " x " + tipoPizza + " = " + precioTotal6);
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal6;

                    break;
                default:
                    System.out.println("❌❌❌❌❌❌Opcion no valida❌❌❌❌❌❌");
            }
        } while (opcion < 1 || opcion > 7);


    }

    public static void finalizarPedido() {
        System.out.println("--------------------------------------------------------------------");
        DecimalFormat df = new DecimalFormat("0.00"); // Formato para dos decimales
        System.out.println("\n=== Boleta de Pago ===");
        System.out.println("Nombre: ");
        System.out.println("Monto pagado: $" + df.format(+total));
        System.out.println("Saldo total: $");
        System.out.println("======================\n");
        System.out.println("--------------------------------------------------------------------");

    }

    public static void mostrarCarrito() {
        DecimalFormat df = new DecimalFormat("0.00");
        System.out.println("Contenido del carrito: ");
        double totalCarrito = 0;
        for (Producto producto : carrito) {
            double subtotal = producto.calcularSubtotal();
            totalCarrito += subtotal;
            System.out.println(producto.cantidad + " x " + producto.nombre + " - Subtotal: " + df.format(subtotal) + " soles.");
        }
        System.out.println("Total del carrito: " + df.format(totalCarrito) + " soles.");
    }

    public static void emitirFactura(double totalCarrito) {
        StringBuilder facturaContenido = new StringBuilder();
        SimpleDateFormat fechitaUgU = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date fecha = new Date();
        DecimalFormat df = new DecimalFormat("0.00");
        double igv = totalCarrito * 0.18;
        double subtotal = totalCarrito - igv;
        double totalisimo = subtotal + igv;

        facturaContenido.append("--------------------------------------------------------------------\n\n");
        facturaContenido.append("                       ------ Factura ------                        \n");
        facturaContenido.append("             ██████╗ ██╗██╗  ██╗ █████╗ ██╗██╗     ██╗   ██╗\n");
        facturaContenido.append("             ██╔══██╗██║██║  ██║██╔══██╗██║██║     ██║   ██║\n");
        facturaContenido.append("             ██████╔╝██║███████║███████║██║██║     ██║   ██║\n");
        facturaContenido.append("             ██╔═══╝ ██║██╔══██║██╔══██║██║██║     ██║   ██║\n");
        facturaContenido.append("             ██║     ██║██║  ██║██║  ██║██║███████╗╚██████╔╝\n");
        facturaContenido.append("             ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ \n");
        facturaContenido.append("Fecha: ").append(fechitaUgU.format(fecha)).append("\n");
        facturaContenido.append("Nombre: "+USUARIO_PREDETERMINADO+"\n");
        facturaContenido.append("Detalles del pedido:\n");

        for (Producto producto : carrito) {
            double subtotalCarrito = producto.calcularSubtotal();
            totalCarrito += subtotalCarrito;
            facturaContenido.append(producto.cantidad).append(" x ").append(producto.nombre)
                    .append(" - Subtotal: ").append(subtotalCarrito).append(" soles.\n");
        }

        facturaContenido.append("Subtotal: $").append(df.format(subtotal)).append("\n");
        facturaContenido.append("IGV: $").append(df.format(igv)).append("\n");
        facturaContenido.append("Total: $").append(df.format(totalisimo)).append("\n");
        facturaContenido.append("--------------------------------------------------------------------\n");
        facturaContenido.append("¡Gracias por su compra!\n");
        facturaContenido.append("  SIUUUUUUUUUUUUUUUU\n");

        exportarFacturaTxt(facturaContenido.toString());

        System.exit(0);
    }

    public static void exportarFacturaTxt(String contenido) {
        try {
            FileWriter writer = new FileWriter("factura.txt");
            writer.write(contenido);
            writer.close();
            System.out.println("Factura exportada exitosamente en factura.txt");
        } catch (IOException e) {
            System.err.println("Error al exportar la factura: " + e.getMessage());
        }
    }
    public static boolean verificarVigencia(String fechaExpiracion) {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/yy");
            YearMonth fechaExp = YearMonth.parse(fechaExpiracion, formatter);
            YearMonth fechaActual = YearMonth.now();
            return !fechaExp.isBefore(fechaActual);
        } catch (DateTimeParseException e) {
            System.out.println("La fecha ingresada no es válida. Por favor, usa el formato MM/yy.");
            return false;
        }
    }

    public static void medotoPago() {

        DecimalFormat df = new DecimalFormat("0.00");
        double totalCarrito = 0;


        for (Producto DANIEL : carrito) {
            double subtotal = DANIEL.calcularSubtotal();
            totalCarrito += subtotal;
        }
        System.out.println("--------------------------------------------------------------------");
        System.out.println("El total a pagar es de: " + df.format(totalCarrito));
        System.out.println("Elija su metodo de pago");
        System.out.println("1. Tarjeta de Credito");
        System.out.println("2. Yape");
        int formaPago = sc.nextInt();
        sc.nextLine();
        switch (formaPago) {

            case 1:
                while (true) {
                    System.out.println("Ingrese Numero de Tarjeta");
                    String Tarjeta = sc.nextLine();
                    if (Tarjeta.length() == 16 && Tarjeta.matches("[0-9]+")) {
                        System.out.println("Numero Valido");
                        while (true){
                            System.out.println("Ingrese CVV");
                            String ICV = sc.nextLine();
                            if (ICV.length() == 3 && ICV.matches("[0-9]+")){
                                System.out.println("Numero Valido");
                                while (true){
                                    System.out.print("Ingresa la fecha de expiración de la tarjeta (MM/yy): ");
                                    String fechaExpiracion = sc.nextLine();
                                    boolean esVigente = verificarVigencia(fechaExpiracion);
                                    if (esVigente) {
                                        System.out.println("La tarjeta está vigente.");

                                        System.out.println("Ingresar saldo: ");
                                        double Saldo = sc.nextDouble();

                                        if (Saldo < totalCarrito) {
                                            System.out.println("Saldo insuficiente");
                                            System.out.println("Retírese por favor");
                                            System.out.println("--------------------------------------------------------------------");
                                            System.exit(0);
                                        } else if (Saldo == totalCarrito) {
                                            System.out.println("Pago realizado con éxito");
                                            emitirFactura(totalCarrito);
                                            break;
                                        } else if (Saldo > totalCarrito) {
                                            double cambio = Saldo - totalCarrito;
                                            System.out.println("Pago realizado con éxito");
                                            System.out.println("Su cambio sería de: " + df.format(cambio));
                                            System.out.println("--------------------------------------------------------------------");
                                            emitirFactura(totalCarrito);
                                            break;
                                        }
                                    } else {
                                        System.out.println("La tarjeta ha expirado.");
                                    }
                                }
                                break;
                            }
                            else {
                                System.out.println("Numero no Valido");
                            }

                        }
                        sc.nextLine();
                        break;
                    }else {
                        System.out.println("Numero no Valido");
                    }
                }
                break;
            case 2:

                System.out.println("Usted ha elegido pagar con Yape");
                while (true) {
                    System.out.println("Ingrese su Numero de Yape");
                    String yape = sc.nextLine();
                    if (yape.length() == 9 && yape.matches("[0-9]+")) {
                        System.out.println("Ingresar saldo: ");
                        double Saldo = sc.nextInt();
                        if (Saldo < totalCarrito) {
                            System.out.println("Saldo insuficiente");
                            System.out.println("Retirese por favor");
                            System.out.println("--------------------------------------------------------------------");
                            System.exit(0);

                        } else if (Saldo == totalCarrito) {
                            System.out.println("Pago realizado con exito");
                            emitirFactura(totalCarrito);

                        } else if (Saldo > totalCarrito) {
                            double cambio = Saldo - totalCarrito;
                            System.out.println("Pago realizado con exito");
                            System.out.println("Su cambio seria de: " + df.format(cambio));
                            System.out.println("--------------------------------------------------------------------");
                            emitirFactura(totalCarrito);
                            break;
                        }
                    } else {
                        System.out.println("-------------------------------------------------------------------------");
                        System.out.println("❌❌❌❌No se encotro el Numero❌❌❌❌ ");

                    }}
                break;

            default:
                System.out.println("Opcion no valida");
        }
    }
}
