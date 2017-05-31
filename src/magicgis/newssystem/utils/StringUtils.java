package magicgis.newssystem.utils;

public final class StringUtils {
	
	private StringUtils(){
		
	}

	/**
	 * 将字符串转换为字符串数组
	 */
	public static String[] string2Arr(String str, String tag) {
		if (ValidateUtils.isValid(str)) {
			String[] arr = str.split(tag);
			return arr;
		}
		return null;
	}

	/**
	 * 查询一个字符串数组中是否包含某字符串
	 */
	public static boolean contains(String[] values, String value) {
		if (ValidateUtils.isValid(value)) {
			for (String str : values) {
				if (str.equals(value))
					return true;
			}
		}
		return false;
	}

	/**
	 * 将字符串数组转换为字符串
	 */
	public static String arr2String(Object[] str) {
		if (ValidateUtils.isValid(str)) {
			StringBuffer stringBuffer = new StringBuffer();
			for (Object s : str) {
				stringBuffer.append(s + ",");
			}
			return stringBuffer.substring(0, stringBuffer.length() - 1);
		}
		return null;
	}

	/**
	 * 若字符串长度超出范围，则截取一部分
	 */
	public static String getDescString(String str, int length) {
		if (str != null && str.trim().length() > length) {
			return str.substring(0, length);
		}
		return str;
	}
}
