package net.theairblow.lunarium.gui;

import net.theairblow.lunarium.gui.widget.BleachCheckbox;
import net.theairblow.lunarium.gui.widget.TextPassFieldWidget;
import net.theairblow.lunarium.gui.window.AbstractWindowScreen;
import net.theairblow.lunarium.gui.window.Window;
import net.theairblow.lunarium.gui.window.WindowButton;
import net.theairblow.lunarium.utils.Decrypter;
import net.theairblow.lunarium.utils.LoginManager;
import net.theairblow.lunarium.utils.file.BleachFileMang;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import net.minecraft.client.gui.screen.TitleScreen;
import net.minecraft.client.gui.widget.TextFieldWidget;
import net.minecraft.client.util.math.MatrixStack;
import net.minecraft.item.ItemStack;
import net.minecraft.item.Items;
import net.minecraft.text.LiteralText;

public class LoginManagerScreen extends AbstractWindowScreen {
	
	public TextFieldWidget userField;
	public TextPassFieldWidget passField;
	public BleachCheckbox checkBox;

	public String loginResult = "";

	private List<List<String>> entries = new ArrayList<>();
	
	
	public LoginManagerScreen() {
		super(new LiteralText("Login Manager"));
	}

	public void init() {
		windows.clear();
		windows.add(new Window(width / 4, height / 4 - 10, width / 4 + width / 2, height / 4 + height / 2, "Login Manager", new ItemStack(Items.WRITABLE_BOOK)));
		int x = windows.get(0).x1,
				y = windows.get(0).y1 + 10,
				w = width / 2,
				h = height / 2;
		if (userField == null)
			userField = new TextFieldWidget(textRenderer, x + w / 2 - 98, y + h / 4, 196, 18, LiteralText.EMPTY);
		if (passField == null)
			passField = new TextPassFieldWidget(textRenderer, x + w / 2 - 98, y + h / 4 + 30, 196, 18, LiteralText.EMPTY);
		userField.x = x + w / 2 - 98;
		userField.y = y + h / 4;
		passField.x = x + w / 2 - 98;
		passField.y = y + h / 4 + 30;
		if (checkBox == null)
			checkBox = new BleachCheckbox(x + w / 2 - 99, y + h / 4 + 53, new LiteralText("Save Login"), false);
		checkBox.x = x + w / 2 - 99;
		checkBox.y = y + h / 4 + 53;
		userField.setMaxLength(32767);
		passField.setMaxLength(32767);

		windows.get(0).buttons.add(
				new WindowButton(w / 2 - 100, h / 3 + 84, w / 2 + 100, h / 3 + 104, "Done", () -> {
					windows.get(0).closed = true;
					client.openScreen(new TitleScreen(true));
				}));
		windows.get(0).buttons.add(
				new WindowButton(w / 2 - 100, h / 3 + 62, w / 2 - 2, h / 3 + 82, "Accounts", () -> {
					windows.get(1).closed = false;
					selectWindow(1);
				}));
		windows.get(0).buttons.add(
				new WindowButton(w / 2 + 2, h / 3 + 62, w / 2 + 100, h / 3 + 82, "Login", () -> {
					for (String s : BleachFileMang.readFileLines("logins.txt")) {
						entries.add(new ArrayList<>(Arrays.asList(s.split(":"))));
					}

					loginResult = LoginManager.login(userField.getText(), passField.getText());
					try {
						Decrypter decrypter = new Decrypter(Decrypter.getPassPhrase());
						String text = userField.getText() + ":" + decrypter.encrypt(passField.getText());

						if (checkBox.checked && (loginResult.equals("\u00a7aLogin Successful")
								|| loginResult.equals("\u00a76Logged in as an unverified account"))
								&& !entries.contains(new ArrayList<>(Arrays.asList(text.split(":"))))) {
							entries.add(new ArrayList<>(Arrays.asList(text.split(":"))));
							BleachFileMang.createFile("logins.txt");
							BleachFileMang.appendFile(text, "logins.txt");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}));

		entries.clear();
		BleachFileMang.createFile("logins.txt");

		for (String s : BleachFileMang.readFileLines("logins.txt")) {
			entries.add(new ArrayList<>(Arrays.asList(s.split(":"))));
		}
	}

	public void render(MatrixStack matrix, int mouseX, int mouseY, float delta) {
		renderBackground(matrix);
		super.render(matrix, mouseX, mouseY, delta);
	}

	public void onRenderWindow(MatrixStack matrix, int window, int mX, int mY) {
		super.onRenderWindow(matrix, window, mX, mY);
	}
}
