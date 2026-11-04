import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool mostrarSenha = false;
  bool mostrarConfirmacao = false;

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmacaoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    senhaController.dispose();
    confirmacaoController.dispose();
    super.dispose();
  }

  void criarConta() {
    if (nomeController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        telefoneController.text.trim().isEmpty ||
        senhaController.text.isEmpty ||
        confirmacaoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );
      return;
    }

    if (senhaController.text != confirmacaoController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não são iguais.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cadastro pronto! O Firebase será conectado depois.',
        ),
      ),
    );
  }

  InputDecoration campoDecoracao({
    required String label,
    required IconData icone,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icone,
        color: const Color(0xFFD4AF37),
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFF171717),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFD4AF37),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Criar conta',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 10, 28, 30),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                const Text(
                  'Crie sua conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Cadastre-se para agendar seu próximo atendimento.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white60,
                  ),
                ),

                const SizedBox(height: 30),

                // NOME
                TextField(
                  controller: nomeController,
                  textCapitalization: TextCapitalization.words,
                  decoration: campoDecoracao(
                    label: 'Nome completo',
                    icone: Icons.person_outline,
                  ),
                ),

                const SizedBox(height: 16),

                // E-MAIL
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: campoDecoracao(
                    label: 'E-mail',
                    icone: Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 16),

                // TELEFONE
                TextField(
                  controller: telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: campoDecoracao(
                    label: 'Telefone',
                    icone: Icons.phone_outlined,
                  ),
                ),

                const SizedBox(height: 16),

                // SENHA
                TextField(
                  controller: senhaController,
                  obscureText: !mostrarSenha,
                  decoration: campoDecoracao(
                    label: 'Senha',
                    icone: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          mostrarSenha = !mostrarSenha;
                        });
                      },
                      icon: Icon(
                        mostrarSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // CONFIRMAR SENHA
                TextField(
                  controller: confirmacaoController,
                  obscureText: !mostrarConfirmacao,
                  decoration: campoDecoracao(
                    label: 'Confirmar senha',
                    icone: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          mostrarConfirmacao = !mostrarConfirmacao;
                        });
                      },
                      icon: Icon(
                        mostrarConfirmacao
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // BOTÃO
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: criarConta,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'CRIAR CONTA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Ao criar sua conta, você poderá realizar agendamentos e acompanhar suas reservas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}