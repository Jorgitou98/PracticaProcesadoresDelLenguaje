package ast;

import java.util.List;

public class LlamadaFun extends E{
	private List<E> argumentos;
	private E iden ;
	private NodoArbol ref;
	public LlamadaFun(E iden, List<E> argumentos, boolean asignable) {
		  super(asignable);
		this.argumentos = argumentos;
		this.iden = iden;
	}
	
	
	public void setRef(NodoArbol ref) {
		this.ref = ref;
	}


	public TipoE tipo() {
		return TipoE.LLAMADAFUN;
	}
	
	public List<E> getArgumentos() {
		return argumentos;
	}
	public E getIden() {
		return iden;
	}
	public String toString() {
		String args ="";
		for(E exp:argumentos) {
			args = args + ", " +exp.toString();
		}
		return "funcion( iden: " + iden.toString() + ", argumentos: " + args + ")";
		
	}
	@Override
	public String imprime(String prev, boolean barra) {
		String s = prev + "\\__LlamadaFun\n";
	    String next = prev;
		if(barra) next += "|";
		else next += " ";
		s = s + next + "  \\__Identificador\n";
		String nextIden = next + "  |";
		for (int i = 0; i < "__Identificador".length(); ++i) {
			nextIden += " ";
		}
		s = s + iden.imprime(nextIden, true);
		
		s = s + next + "   \\__Ref\n";
		String nextRef = next + "   |";
		for (int i = 0; i < "__Ref".length(); ++i ) {
			nextRef += " ";
		}
		s+= ref.imprime(nextRef, false);
		
		s = s + next +"  \\__Argumentos\n";
		String nextArg = next + "   ";
		
		for (int i = 0; i < "__Argumentos".length(); ++i) {
			nextArg += " ";
		}
		for (int i = 0; i < argumentos.size(); ++i) {
			if(i == argumentos.size()-1) s += argumentos.get(i).imprime(nextArg, false);
			else s += argumentos.get(i).imprime(nextArg, true);
		}
		return s;
	}

}
