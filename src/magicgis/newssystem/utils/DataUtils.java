package magicgis.newssystem.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.models.security.Role;

public final class DataUtils {

	private DataUtils() {

	}

	/**
	 * MD5加密
	 */
	public static String md5(String str) {
		try {
			StringBuffer buffer = new StringBuffer();
			char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F' };
			byte[] bytes = str.getBytes();
			MessageDigest digest = MessageDigest.getInstance("md5");
			byte[] targ = digest.digest(bytes);
			for (byte b : targ) {
				buffer.append(chars[b >> 4 & 0x0F]);
				buffer.append(b & 0x0F);
			}
			return buffer.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 深度复制
	 */
	public static Serializable deeplyCopy(Serializable serializable) {

		try {
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(
					byteArrayOutputStream);
			objectOutputStream.writeObject(serializable);
			objectOutputStream.close();
			byteArrayOutputStream.close();

			byte[] bytes = byteArrayOutputStream.toByteArray();
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(
					bytes);
			ObjectInputStream objectInputStream = new ObjectInputStream(
					byteArrayInputStream);
			Serializable copy = (Serializable) objectInputStream.readObject();
			objectInputStream.close();
			byteArrayInputStream.close();

			return copy;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 获得Set<Right>中元素的Id，组成字符串
	 */
	public static String extractRightIds(Set<Right> rights) {
		StringBuffer buffer = new StringBuffer();
		if (ValidateUtils.isValid(rights)) {
			for (Right r : rights) {
				buffer.append(r.getId() + ",");
			}
			String str = buffer.substring(0, buffer.length() - 1);
			return str;
		}
		return null;
	}

	public static String extractRoleIds(Set<Role> rights) {
		StringBuffer buffer = new StringBuffer();
		if (ValidateUtils.isValid(rights)) {
			for (Role r : rights) {
				buffer.append(r.getId() + ",");
			}
			String str = buffer.substring(0, buffer.length() - 1);
			return str;
		}
		return null;
	}

}
