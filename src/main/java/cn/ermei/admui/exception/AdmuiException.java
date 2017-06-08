package cn.ermei.admui.exception;

/**
 * Admui Exception
 * 
 * @author  dk
 * @since   Admui v1.0.0
 */
public class AdmuiException extends Exception {

	private static final long serialVersionUID = 5447628653259133057L;

	public AdmuiException() {
		super();
	}

	public AdmuiException(String message) {
		super(message);
	}

	public AdmuiException(String message, Throwable cause) {
		super(message, cause);
	}

	public AdmuiException(Throwable cause) {
		super(cause);
	}

}
