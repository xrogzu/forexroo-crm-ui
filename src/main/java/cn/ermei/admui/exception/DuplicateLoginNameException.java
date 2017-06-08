package cn.ermei.admui.exception;

/**
 * 新增用户，loginName重复时抛出
 * 
 * @author  dk
 * @since   Admui v1.0.0
 */
public class DuplicateLoginNameException extends AdmuiException {

	private static final long serialVersionUID = -3596286783974457886L;

	/**
     * Constructs an <code>InitMenuException</code> with no
     * detail message.
     */
	public DuplicateLoginNameException() {
		super();
	}

	/**
     * Constructs an <code>InitMenuException</code> with the
     * specified detail message.
     *
     * @param  message  the detail message.
     */
	public DuplicateLoginNameException(String message) {
		super(message);
	}

}
