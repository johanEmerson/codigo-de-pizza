import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.text.DecimalFormat;
import java.util.Scanner;

public class Pizza_Hubds {

    public static Scanner sc = new Scanner(System.in);
    public static double total = 0;
    public static final double IGV = 0.18;
    public static Map<String, String> cuentas = new HashMap<>();
    public static final String USUARIO_PREDETERMINADO = "ben";
    public static final String CONTRASENA_PREDETERMINADA = "23";

    public static void main(String[] args) {

        while (true) {
            System.out.println("---------------------------------------------------------------------------------------------------------");
            System.out.println("                                        Seleccione una opción:");
            System.out.println("             1. Crear cuenta");
            System.out.println("             2. Usar cuenta existente");
            System.out.println("----------------------------------------------------------------------------------------------------------");
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
    public static void logo(){
        System.out.println("                                     B I E N V E N I D O ");



    }

    public static void mostrarMenu() {

        System.out.println("----------------------------------------------------------------------------------------------------------");
        System.out.println("                                       \nMENU PRINCIPAL:");
        System.out.println("1. Pedir pizza");
        System.out.println("2. Pedir antojos");
        System.out.println("3. Pedir bebidas");
        System.out.println("4. Pedir Para Mi");
        System.out.println("5. Pedir Ofertas");
        System.out.println("6. Pedir Combos Huts");
        System.out.println("7. Pedir Las Mas Huts");
        System.out.println("8. Finalizar pedido");
        System.out.println("----------------------------------------------------------------------------------------------------------");
    }

    public static int obtenerOpcionDelUsuario() {
        System.out.print("Seleccione una opción: ");
        return sc.nextInt();
    }

    public static void procesarPizza() {
        System.out.println("\nMenú de pizzas:");
        System.out.println("0. volver al menu principal");
        System.out.println("1. 4 hits en 1");
        System.out.println("2. La chili hut");
        System.out.println("3. Super suprema");
        System.out.println("4. Chicken BBQ");
        System.out.println("5. Hawaiana ");
        System.out.println("6. Americana ");
        System.out.println("7. Continental ");
        System.out.println("8. Pepperonii ");
        System.out.println("9. XL clasica ");
        System.out.println("10. Suprema ");
        System.out.println("11. Mozzarella ");
        System.out.println("12. Meat lovers ");
        System.out.println("13. Vegetariana ");

        System.out.print("Seleccione una opción: ");
        int opcion = sc.nextInt();
        sc.nextLine();

        switch (opcion) {
            case 0:

                break;
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
            case 14:
                break;

            default:
                System.out.println("Opción inválida.");
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 19.90;
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 25.90;
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 29.90;
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 35.90;
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
                        break;
                    default:
                        System.out.println("Tipo de pizza inválido.");
                        return;
                }
                break;
            case 3: // Familiar
                switch (tipo) {
                    case 1:
                        precio = 35.90;
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 39.90;
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 45.90;
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 35.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void  procesarHawaiana() {
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void  procesarAmericana() {
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void  procesarPepperonii() {
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

            case 3 :

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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarXLClasica () {
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;

    }

    public static void procesarSuprema () {
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarMozzarella () {
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 20.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 26.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 27.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 33.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 37.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 43.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarMeatlovers (){
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 30.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 36.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 39.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 45.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 49.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 55.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarVegetariana (){
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
                        tipoPizza = "Mediana Artesanal";
                        break;
                    case 2:
                        precio = 25.90; // Mediana Pan pizza
                        tipoPizza = "Mediana Pan pizza";
                        break;
                    case 3:
                        precio = 31.90; // Mediana Hut cheese
                        tipoPizza = "Mediana Hut cheese (Borde de queso)";
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
                        tipoPizza = "Grande Artesanal";
                        break;
                    case 2:
                        precio = 32.90; // Grande Pan pizza
                        tipoPizza = "Grande Pan pizza";
                        break;
                    case 3:
                        precio = 38.90; // Grande Hut cheese
                        tipoPizza = "Grande Hut cheese (Borde de queso)";
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
                        tipoPizza = "Familiar Artesanal";
                        break;
                    case 2:
                        precio = 42.90; // Familiar Pan pizza
                        tipoPizza = "Familiar Pan pizza";
                        break;
                    case 3:
                        precio = 48.90; // Familiar Hut cheese
                        tipoPizza = "Familiar Hut cheese (Borde de queso)";
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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }

    public static void procesarAntojos() {
        System.out.println("Seleccione su antojito");
        System.out.println("Seleccione uno de los antojos o salsas");
        System.out.println("Opcion 1.- SALADOS");
        System.out.println("Opcion 2.- DULCES");
        System.out.println("Opcion 3.- SALSAS");
        int antojitos = sc.nextInt();
        switch (antojitos) {
            case 1:
                System.out.println("""
                                                 ANTOJITOS SALADOS
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
                                """);
                int salados = sc.nextInt();
                switch (salados) {
                    case 1:
                        System.out.println("¿Cuantas unidades comprara?, solo puede escoger entre 6 y 10 unidades");
                        System.out.println("Seleccione cuantas unidades llevara");
                        System.out.println("Opcion 1.- 6U ");
                        System.out.println("Opcion 2.- 10U ");
                        int cantidadP = sc.nextInt();
                        switch (cantidadP) {
                            case 1:
                                System.out.println("¿Cuantas unidades de seis palitos comprara?");
                                int cantidadPalitos6 = sc.nextInt();
                                double precioTotal = 9.90 * cantidadPalitos6;
                                double subtotal = precioTotal / (1 + IGV);
                                double montoIGV = precioTotal - subtotal;

                                System.out.printf("Subtotal: %.2f%n", subtotal);
                                System.out.printf("IGV: %.2f%n", montoIGV);
                                System.out.printf("Precio Total: %.2f%n", precioTotal);
                                break;
                            case 2:
                                System.out.println("¿Cuantas unidades de seis palitos comprara?");
                                int cantidadPalitos10 = sc.nextInt();
                                double precioTotal10 = 11.90 * cantidadPalitos10;
                                double subtotal10 = precioTotal10 / (1 + IGV);
                                double montoIGV10 = precioTotal10 - subtotal10;

                                System.out.printf("Subtotal: %.2f%n", subtotal10);
                                System.out.printf("IGV: %.2f%n", montoIGV10);
                                System.out.printf("Precio Total: %.2f%n", precioTotal10);
                                break;
                            default:
                                System.out.println("Esa opcion no existe");
                        }
                    case 2:
                        System.out.println("¿Cuantas unidades de Pan al Ajo comprara?");
                        int cantidadPan = sc.nextInt();
                        double precioTotal = 10.90 * cantidadPan;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;

                        System.out.printf("Subtotal: %.2f%n", subtotal);
                        System.out.printf("IGV: %.2f%n", montoIGV);
                        System.out.printf("Precio Total: %.2f%n", precioTotal);
                        break;
                    case 3:
                        System.out.println("¿Cuantas unidades de Pan al Ajo Especial comprara?");
                        int cantidadE = sc.nextInt();
                        double precioTotalE = 13.90 * cantidadE;
                        double subtotalE = precioTotalE / (1 + IGV);
                        double montoIGVE = precioTotalE - subtotalE;

                        System.out.printf("Subtotal: %.2f%n", subtotalE);
                        System.out.printf("IGV: %.2f%n", montoIGVE);
                        System.out.printf("Precio Total: %.2f%n", precioTotalE);
                        break;
                    case 4:
                        System.out.println("¿Cuantas unidades de Rollos comprara?");
                        int cantidadR = sc.nextInt();
                        double precioTotalR = 15.90 * cantidadR;
                        double subtotalR = precioTotalR / (1 + IGV);
                        double montoIGVR = precioTotalR - subtotalR;

                        System.out.printf("Subtotal: %.2f%n", subtotalR);
                        System.out.printf("IGV: %.2f%n", montoIGVR);
                        System.out.printf("Precio Total: %.2f%n", precioTotalR);
                        break;
                    case 5:
                        System.out.println("¿Cuantas unidades de Alitas comprara, solo tine para escoger entre 6U o 9U");
                        System.out.println("Seleccione el tipo de salsa");
                        System.out.println("Opcion 1.- 6U HUT");
                        System.out.println("Opcion 2.- 6U BBQ");
                        System.out.println("Opcion 3.- 6U SIN SALSA");
                        System.out.println("Opcion 4.- 9U HUT");
                        System.out.println("Opcion 5.- 9U BBQ");
                        System.out.println("Opcion 6.- 9U SIN SALSA");
                        int cantidadA = sc.nextInt();
                        switch (cantidadA) {
                            case 1:
                                System.out.println("¿Cuantas unidades de alitas HUT comprara?");
                                int cantidadAlitasHUT = sc.nextInt();
                                double precioTotalhut = 15.90 * cantidadAlitasHUT;
                                double subtotalhut = precioTotalhut / (1 + IGV);
                                double montoIGVhut = precioTotalhut - subtotalhut;

                                System.out.printf("Subtotal: %.2f%n", subtotalhut);
                                System.out.printf("IGV: %.2f%n", montoIGVhut);
                                System.out.printf("Precio Total: %.2f%n", precioTotalhut);
                                break;
                            case 2:
                                System.out.println("¿Cuantas unidades de alitas BBQ comprara?");
                                int cantidadAlitasBBQ = sc.nextInt();
                                double precioTotalbbq = 15.90 * cantidadAlitasBBQ;
                                double subtotalbbq = precioTotalbbq / (1 + IGV);
                                double montoIGVBBQ = precioTotalbbq - subtotalbbq;

                                System.out.printf("Subtotal: %.2f%n", subtotalbbq);
                                System.out.printf("IGV: %.2f%n", montoIGVBBQ);
                                System.out.printf("Precio Total: %.2f%n", precioTotalbbq);
                                break;
                            case 3:
                                System.out.println("¿Cuantas unidades de alitas sin salsa DE 6U comprara?");
                                int cantidadAlitasSIN = sc.nextInt();
                                double precioTotalsin = 15.90 * cantidadAlitasSIN;
                                double subtotalsin = precioTotalsin / (1 + IGV);
                                double montoIGVSIN = precioTotalsin - subtotalsin;

                                System.out.printf("Subtotal: %.2f%n", subtotalsin);
                                System.out.printf("IGV: %.2f%n", montoIGVSIN);
                                System.out.printf("Precio Total: %.2f%n", precioTotalsin);
                                break;
                            case 4:
                                System.out.println("¿Cuantas unidades de alitas BBQ DE 9U comprara?");
                                int cantidadAlitas9HUT = sc.nextInt();
                                double precioTotalHUT = 20.90 * cantidadAlitas9HUT;
                                double subtotalHUT = precioTotalHUT / (1 + IGV);
                                double montoIGVHut = precioTotalHUT - subtotalHUT;

                                System.out.printf("Subtotal: %.2f%n", subtotalHUT);
                                System.out.printf("IGV: %.2f%n", montoIGVHut);
                                System.out.printf("Precio Total: %.2f%n", precioTotalHUT);
                                break;
                            case 5:
                                System.out.println("¿Cuantas unidades de alitas BBQ comprara?");
                                int cantidadAlitasBBQ9 = sc.nextInt();
                                double precioTotalBBQ9 = 20.90 * cantidadAlitasBBQ9;
                                double subtotalBBQ = precioTotalBBQ9 / (1 + IGV);
                                double montoIGVBBQ9 = precioTotalBBQ9 - subtotalBBQ;

                                System.out.printf("Subtotal: %.2f%n", subtotalBBQ);
                                System.out.printf("IGV: %.2f%n", montoIGVBBQ9);
                                System.out.printf("Precio Total: %.2f%n", precioTotalBBQ9);
                                break;
                            case 6:
                                System.out.println("¿Cuantas unidades de alitas sin salsa comprara?");
                                int cantidadAlitas9SIN = sc.nextInt();
                                double precioTotalSIN = 20.90 * cantidadAlitas9SIN;
                                double subtotalSIN = precioTotalSIN / (1 + IGV);
                                double montoIGV9USIN = precioTotalSIN - subtotalSIN;

                                System.out.printf("Subtotal: %.2f%n", subtotalSIN);
                                System.out.printf("IGV: %.2f%n", montoIGV9USIN);
                                System.out.printf("Precio Total: %.2f%n", precioTotalSIN);
                                break;
                            default:
                                System.out.println("Esa opcion no existe");
                        }
                }
            case 2:
                System.out.println(""" 
                                      ANTOJITOS DULCES
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
                                """);
                int dulces = sc.nextInt();
                switch (dulces) {
                    case 1:
                        System.out.println("¿Cuantos HUT CHURROS compraras?");
                        int cantidadChurros = sc.nextInt();
                        double precioTotal = 5.90 * cantidadChurros;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;

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

                        System.out.printf("Subtotal: %.2f%n", subtotalC);
                        System.out.printf("IGV: %.2f%n", montoIGVC);
                        System.out.printf("Precio Total: %.2f%n", precioTotalC);
                        break;
                    default:
                        System.out.println("Esa cantidad no existe");
                }
            case 3:
                System.out.println("""
                                           SALSAS
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
                                """);
                int salsas = sc.nextInt();
                switch (salsas) {
                    case 1:
                        System.out.println("¿Cuantas MAYOHUT llevara?");
                        int cantidadMayohut = sc.nextInt();
                        double precioTotal = 1.50 * cantidadMayohut;
                        double subtotal = precioTotal / (1 + IGV);
                        double montoIGV = precioTotal - subtotal;

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

                        System.out.printf("Subtotal: %.2f%n", subtotalSA);
                        System.out.printf("IGV: %.2f%n", montoIGVSA);
                        System.out.printf("Precio Total: %.2f%n", precioTotalSA);
                        break;
                    default:
                        System.out.println("No existe esa opción");
                }
        }
    }

    public static void procesarBebidas() {
        System.out.println("Seleccione sus bebidas");
        System.out.println("""
                                      BEBIDAS
                        Opcion 1:  (COCA COLA SIN AZUCAR)   | Para recojo de tienda se entregarán vasos |
                        Precio:    PERSONAL ($4.90)         |        de gaseosa según apliquen          |
                                   1 LITRO  ($8.90)
                        
                        Opcion 2: (INCA KOLA SIN AZUCAR)    | Para recojo de tienda se entregarán vasos |
                        Precio:   PERSONAL  ($4.90)         |       de gaseosa según apliquen           |
                                  1 LITRO   ($8.90)
                        
                        Opcion 3: (SPRITE PERSONAL)         | Para recojo de tienda se entregara 1 vaso |
                        Precio:   ($4.90)                   |       de gaseosa según apliquen           |
                        
                        Opcion 4: (FANTA PERSONAL)          | Para recojo de tienda se entregara 1 vaso |
                        Precio:   ($4.90)                   |       de gaseosa según apliquen           |
                        
                        Opcion 5: (AGUA SAN LUIS SIN GAS)   |         Agua San Luis sin gas|            |
                        Precio:   ($4.90)
                        """);
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

                        System.out.printf("Subtotal: %.2f%n", subtotalCL);
                        System.out.printf("IGV: %.2f%n", montoIGVCL);
                        System.out.printf("Precio Total: %.2f%n", precioTotalCL);
                        break;
                }
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

                        System.out.printf("Subtotal: %.2f%n", subtotalIL);
                        System.out.printf("IGV: %.2f%n", montoIGVIL);
                        System.out.printf("Precio Total: %.2f%n", precioTotalIL);
                        break;
                    default:
                        System.out.println("Esa opcion no existe");
                }
            case 3:
                System.out.println("¿Cuantas unidades llevará?");
                int cantidadPersonalesE = sc.nextInt();
                double precioTotalE = 4.90 * cantidadPersonalesE;
                double subtotalE = precioTotalE / (1 + IGV);
                double montoIGVE = precioTotalE - subtotalE;

                System.out.printf("Subtotal: %.2f%n", subtotalE);
                System.out.printf("IGV: %.2f%n", montoIGVE);
                System.out.printf("Precio Total: %.2f%n", precioTotalE);
                break;
            case 4:
                System.out.println("¿Cuantas unidades llevará?");
                int cantidadPersonalesF = sc.nextInt();
                double precioTotalF = 4.90 * cantidadPersonalesF;
                double subtotalF = precioTotalF / (1 + IGV);
                double montoIGVF = precioTotalF - subtotalF;

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

                System.out.printf("Subtotal: %.2f%n", subtotalA);
                System.out.printf("IGV: %.2f%n", montoIGVA);
                System.out.printf("Precio Total: %.2f%n", precioTotalA);
                break;
        }

    }

    public static void procesarParaMi() {
        System.out.println("Seleccione su combo personal");
        System.out.println("""
                                                PARA MI
                        Opcion 1: (MY BOX CLASSICO)        | 1 Pizza Personal                                 |
                        Precio: $14.90                     | 3 Palitos a la Siliciana                         |
                                                           | 1 Bebida Personal                                |
                        
                        Opcion 2: (MY BOX SUPREMO)         | Si tienes Hambre esta caja es tuya:              |
                        Precio: $19.90                     | 1 Pizza Personal                                 |
                                                           | 3 Alitas BBQ                                     |
                                                           | 1 Bebida Personal                                |
                        
                        Opcion 3: (DUO LASAGNA BOLOGNESA)  | ¡Tu favorita de Siempre!                         |
                        Precio: $24.90                     | 1 Lasagna Bolognesa                              |
                                                           | 1 Bebida Personal                                |
                        
                        Opcion 4: (MIERCOLES DE FALABELLA) | 1 Pizza Mediana (Americana, Pepperoni o Suprema) |
                        Precio: $12.90                     | 1 Bebida Regular                                 |
                        """);
        int combos = sc.nextInt();
        switch (combos) {
            case 1:
                System.out.println("¿Cuantos combos comprara?");
                int cantidadComboClassico = sc.nextInt();
                double precioTotalC = 14.90 * cantidadComboClassico;
                double subtotal = precioTotalC / (1 + IGV);
                double montoIGVC = precioTotalC - subtotal;

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

                System.out.printf("Subtotal: %.2f%n", subtotalF);
                System.out.printf("IGV: %.2f%n", montoIGVF);
                System.out.printf("Precio Total: %.2f%n", precioTotal);
                break;
            default:
                System.out.println("ERROR");
        }
    }
    public static void procesarOfertas() {

        int opcion;
        do{
            System.out.println("---------------------------------------------------------------------------------------------------");
            System.out.println("                                   BIENVENIDO A NUESTRA CARTA");
            System.out.println("                                         || ofertas ||");
            System.out.println("                              SELECCIONE LA OPCION QUE MAS LE GUSTE");
            System.out.println("""
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
                 - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                 - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                 - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                 - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                 - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                 - - - - - - - - -  - - - - - - - -                                   |  - - - - - - - - -  - - - - - - - -
                """);
            System.out.println("------------------------------------------------------------------------------------------------------------");
            System.out.print("Opcion:");
            opcion = sc.nextInt();
            switch (opcion){
                case 1:
                    SolucionIGV(20.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    2X1 PIZZAS MEDIANAS");
                    System.out.println("Se le añadio a asu carrito");
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    break;
                case 2:
                    SolucionIGV(21.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                               USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       COMBO MEDIANO");
                    System.out.println("Se le añadio a asu carrito");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    break;
                case 3:
                    SolucionIGV(19.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                             USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                         LA FIJA");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    break;
                case 4:
                    SolucionIGV(39.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                      BANQUETE GRANDE");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------------");
                    break;
                case 5:
                    SolucionIGV(49.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                     BANQUETE FAMILIAR ");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    break;
                case 6:
                    SolucionIGV(24.90);
                    System.out.println("----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   COMBO MEDIANO 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    break;
                case 7:
                    SolucionIGV(34.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO GRANDE 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 8:
                    SolucionIGV(44.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO/");
                    System.out.println("                                    COMBO FAMILIAR 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 9:
                    SolucionIGV(50.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                              COMOBO FAMILIAR HUT CHEESE 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 10:
                    SolucionIGV(24.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                   USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       HUT COMBO MEDIANO");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 11:
                    SolucionIGV(24.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                        COMBO LA FIJA");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 12:
                    SolucionIGV(36.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                  USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       HUT CHEESE MEDIANO");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 13:
                    SolucionIGV(32.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   PIZZA GRANDE HUT CHEESE");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 14:
                    SolucionIGV(45.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                  BANQUETE GRANDE HUT CHEESE");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");

                    break;
                case 15:
                    SolucionIGV(49.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO CHEESY Y BITES");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 16:
                    SolucionIGV(69.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                       COMBO PIZZA XL");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    break;
                case 17:
                    SolucionIGV(112.90);
                    System.out.println("-----------------------------------------------------------------------------------------------------------");
                    System.out.println("                                   USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    COMBO TRIPACK FAMILIAT");
                    System.out.println("Se le añadio a asu carrito.🛒");
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
                System.out.println("La cantidad deve ser mayor a 0");
            }
        }while (cantidad <0);

            double precioTotal = precio * cantidad;
            double subtotal = precioTotal / (1 + IGV);
            double montoIGV = precioTotal - subtotal;

            System.out.println("Subtotal: " + subtotal);
            System.out.println("IGV: " + montoIGV);
            System.out.println("Precio Total: " + precioTotal);



            total += precioTotal;




    }

    public static void procesarCombosHuts() {
        System.out.println("\nMenú de Combos Huts:");
        System.out.println("1. Hut Days - $49.90");
        System.out.println("2. Hut Days Doble - $39.90");
        System.out.println("3. Doble o Nada Hut Cheese - $79.90");
        System.out.println("4. Tripack Grande Hut Cheese - $94.90");
        System.out.println("5. Combo Doble o Nada Grande - $59.90");
        System.out.println("6. Combo Semi Full Grande - $59.90");
        System.out.println("7. Banquete Familiar Hut Cheese - $55.90");
        System.out.println("8. Tripack Familiar - $99.90");
        System.out.println("9. Tripack Grande - $79.90");
        System.out.println("10. Combo Tripack Grande Hut Cheese - $99.90");
        System.out.println("11. Combo Semi Full Familiar - $79.90");
        System.out.println("12. Combo Semi Full Familiar Hut Cheese - $89.90");
        System.out.println("13. Combo Doble o Nada Familiar - $82.90");
        System.out.println("14. Combo Doble o Nada Familiar Hut Cheese - $92.90");

        System.out.print("Seleccione una opción: ");
        int opcion = sc.nextInt();
        sc.nextLine();

        System.out.print("¿Cuántos combos desea? ");
        int cantidad = sc.nextInt();
        sc.nextLine();

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

        System.out.println("El subtotal de tu compra es: " + subtotal + " soles.");
        System.out.println("El IGV aplicado es: " + montoIGV + " soles.");
        System.out.println("El precio total a pagar es: " + precioTotal + " soles.");

        total += precioTotal;
    }
    public static void procesarLasMasHuts() {
        int opcion;
        do{

            System.out.println("---------------------------------------------------------------------------------------------------");
            System.out.println("                             BIENVENIDO A NUESTRA CARTA |||las mas huts|||");
            System.out.println("                                 SELECCIONE LA OPCION QUE MAS LE GUSTE");
            System.out.println("""
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
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                     - - - - - - - - -  - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -  - - - - - - - -
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
                                                      - - - - - - - - - -  - - - - - - - - -
                    """);
            System.out.println("--------------------------------------------------------------------------------------------------------");
            System.out.print("Opcion:");

            opcion = sc.nextInt();

            switch (opcion){
                case 1:
                    int cantidad;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad = sc.nextInt();
                    if (cantidad < 0) {
                        System.out.println("La cantidad deve ser mayor a 0");
                    }
                    }while (cantidad <0);

                    double precioTotal = 49.90 * cantidad;
                    double subtotal = precioTotal / (1 + IGV);
                    double montoIGV = precioTotal - subtotal;

                    System.out.println("Subtotal: "+ subtotal);
                    System.out.println("IGV: "+ montoIGV);
                    System.out.println("Precio Total: "+ precioTotal);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                               USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                 COMBO PILSEN GRANDE 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal;

                    break;
                case 2:
                    int cantidad1 ;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad1 = sc.nextInt();
                        if (cantidad1 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    }while (cantidad1 <0);

                    double precioTotal1 = 59.90 * cantidad1;
                    double subtotal1 = precioTotal1 / (1 + IGV);
                    double montoIGV1 = precioTotal1 - subtotal1;

                    System.out.println("Subtotal: "+ subtotal1);
                    System.out.println("IGV: "+ montoIGV1);
                    System.out.println("Precio Total: "+ precioTotal1);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                 USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                 COMBO PILSEN FAMILIAR 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal1;



                    break;
                case 3:
                    int cantidad2 ;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad2 = sc.nextInt();
                        if (cantidad2 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    }while (cantidad2 <0);

                    double precioTotal2 = 65.90 * cantidad2;
                    double subtotal2 = precioTotal2 / (1 + IGV);
                    double montoIGV2 = precioTotal2 - subtotal2;

                    System.out.println("Subtotal: "+ subtotal2);
                    System.out.println("IGV: "+ montoIGV2);
                    System.out.println("Precio Total: "+ precioTotal2);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                          COMBO PILSEN FAMILIAR HUT CHEESE 4 EN 1");
                    System.out.println("Se le añadio a asu carrito.🛒");



                    total += precioTotal2;
                    System.out.println("-----------------------------------------------------------------------------------------------");
                    break;
                case 4:
                    int cantidad3;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad3 = sc.nextInt();
                        if (cantidad3 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    }while (cantidad3 <0);

                    double precioTotal3 = 42.90 * cantidad3;
                    double subtotal3 = precioTotal3 / (1 + IGV);
                    double montoIGV3 = precioTotal3 - subtotal3;

                    System.out.println("Subtotal: "+ subtotal3);
                    System.out.println("IGV: "+ montoIGV3);
                    System.out.println("Precio Total: "+ precioTotal3);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    HUT COMPLETO MEDIANO");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal3;
                    break;
                case 5:
                    int cantidad4;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad4 = sc.nextInt();
                        if (cantidad4 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    }while (cantidad4 <0);

                    double precioTotal4 = 49.90 * cantidad4;
                    double subtotal4 = precioTotal4 / (1 + IGV);
                    double montoIGV4 = precioTotal4 - subtotal4;

                    System.out.println("Subtotal: "+ subtotal4);
                    System.out.println("IGV: "+ montoIGV4);
                    System.out.println("Precio Total: "+ precioTotal4);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    DOBLE O NADA GRANDE");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal4;

                    break;
                case 6:
                    int cantidad5;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad5 = sc.nextInt();
                        if (cantidad5 < 0) {
                            System.out.println("La cantidad deve ser mayor a 0");
                        }
                    }while (cantidad5 <0);

                    double precioTotal5 = 29.90 * cantidad5;
                    double subtotal5 = precioTotal5 / (1 + IGV);
                    double montoIGV5= precioTotal5 - subtotal5;

                    System.out.println("Subtotal: "+ subtotal5);
                    System.out.println("IGV: "+ montoIGV5);
                    System.out.println("Precio Total: "+ precioTotal5);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                    4 HITS EN 1 GRANDE");
                    System.out.println("Se le añadio a asu carrito.🛒");
                    System.out.println("------------------------------------------------------------------------------------------------------");


                    total += precioTotal5;

                    break;
                case 7:
                    int cantidad6;
                    do{
                    System.out.println("----------------------------------------------------------------------------------------------");
                    System.out.println("                               INGRESE LA CANTIDAD");
                    cantidad6 = sc.nextInt();
                    if (cantidad6 < 0) {
                        System.out.println("La cantidad deve ser mayor a 0");
                    }
            }while (cantidad6 <0);


                    double precioTotal6 = 72.90 * cantidad6;
                    double subtotal6 = precioTotal6 / (1 + IGV);
                    double montoIGV6 = precioTotal6 - subtotal6;
                    System.out.println("------------------------------------------------------------------------------------------------");
                    System.out.println("Subtotal: "+ subtotal6);
                    System.out.println("IGV: "+ montoIGV6);
                    System.out.println("Precio Total: "+ precioTotal6);
                    System.out.println("------------------------------------------------------------------------------------------------------");
                    System.out.println("                                USTED A ADQUIRIDO EL PRODUCTO");
                    System.out.println("                                   DOBLE O NADA FAMILIAR");
                    System.out.println("Se le añadio a asu carrito.🛒");
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
        System.out.println("Nombre: " );
        System.out.println("Monto pagado: $"+df.format(total) );
        System.out.println("Saldo total: $");
        System.out.println("======================\n");
        System.out.println("--------------------------------------------------------------------");

    }
    public static void emitirFactura() {
        SimpleDateFormat fechitaUgU = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date fecha = new Date();
        DecimalFormat df = new DecimalFormat("0.00");
        double igv = total*0.18;
        double subtotal = total - igv;
        System.out.println("--------------------------------------------------------------------");
        System.out.println();
        System.out.println("                       ------ Factura ------                        ");
        System.out.println("             ██████╗ ██╗██╗  ██╗ █████╗ ██╗██╗     ██╗   ██╗");
        System.out.println("             ██╔══██╗██║██║  ██║██╔══██╗██║██║     ██║   ██║");
        System.out.println("             ██████╔╝██║███████║███████║██║██║     ██║   ██║");
        System.out.println("             ██╔═══╝ ██║██╔══██║██╔══██║██║██║     ██║   ██║");
        System.out.println("             ██║     ██║██║  ██║██║  ██║██║███████╗╚██████╔╝");
        System.out.println("             ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ");
        System.out.println("Fecha: " + fechitaUgU.format(fecha));
        System.out.println("Detalles del pedido:");
        System.out.println("Subtotal: $"+ df.format(subtotal));
        System.out.println("IGV: $" + df.format(igv));
        System.out.println("Total: $" + df.format(total));
        System.out.println("--------------------------------------------------------------------");
        System.out.println("¡Gracias por su compra!");
        System.out.println("  SIUUUUUUUUUUUUUUUU");
    }
    public static void medotoPago(){
        DecimalFormat df = new DecimalFormat("0.00");

        System.out.println("--------------------------------------------------------------------");
        System.out.println("El total de todas sus compras es : "+total);
        System.out.println("--------------------------------------------------------------------");
        System.out.println("              Ingresar saldo: ");
        double Saldo = sc.nextInt();
        if (Saldo < total){
            System.out.println("Saldo insuficiente");
            System.out.println("Retirese por favor");
            System.out.println("--------------------------------------------------------------------");
            System.exit(0);

        }
        else if (Saldo == total){
            System.out.println("Pago realizado con exito");
            emitirFactura();

        }
        else if (Saldo > total){
            System.out.println("El pago ha sido excedido");
            double cambio = Saldo - total;
            System.out.println("Pago realizado con exito");
            System.out.println("Su cambio seria de:"+df.format(cambio));
            System.out.println("--------------------------------------------------------------------");
            emitirFactura();

        }
    }
}
