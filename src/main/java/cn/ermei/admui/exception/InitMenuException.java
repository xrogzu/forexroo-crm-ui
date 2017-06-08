package cn.ermei.admui.exception;

/**
 * 用户授权菜单为空，或者菜单layer不符合规则时抛出
 * <p>
 * 菜单layer规则如下：
 * 
 * <pre>
 * Admui最多支持5级菜单
 * layer示例:0101010101，两位一层
 * <pre>
 * 
 * @author  dk
 * @since   Admui v1.0.0
 */
public class InitMenuException extends AdmuiException {

	private static final long serialVersionUID = -3596286783974457886L;

	/**
     * Constructs an <code>InitMenuException</code> with no
     * detail message.
     */
	public InitMenuException() {
		super();
	}

	/**
     * Constructs an <code>InitMenuException</code> with the
     * specified detail message.
     *
     * @param  message  the detail message.
     */
	public InitMenuException(String message) {
		super(message);
	}

}
