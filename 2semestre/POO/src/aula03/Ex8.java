package aula03;
import java.util.Random;

public class Ex8 {
    public static void main (String[] args) {
        
        int alunos = 16;
		double[][] notas = new double[alunos][3];

		System.out.printf("%6s %6s %6s\n", "NotaT", "NotaP", "Pauta");

		for (int i = 0; i < alunos; i++) {
		    double notaT, notaP, notaFinal;
		    notaT = Math.round(new Random().nextDouble() * 20 * 10) / 10.0;
		    notaP = Math.round(new Random().nextDouble() * 20 * 10) / 10.0;
			
		    if (notaP < 7 || notaT < 7)
			notaFinal = 66;
                    else
		 	notaFinal = Math.round(0.4 * notaT + 0.6 * notaP);
            	
		    if (Math.round(notaFinal) < 10)
               		notaFinal = 66;
			
		    notas[i][0] = notaT;
		    notas[i][1] = notaP;
		    notas[i][2] = (int) notaFinal;

		    System.out.printf("%6.1f %6.1f %6.0f\n", notaT, notaP, notaFinal);
		}

    }
}
