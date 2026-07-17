import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../themes/app_theme.dart';
import '../widgets/monogram.dart';
import '../widgets/accent_button.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_footer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> abrirCorreo() async {
    final uri = Uri(scheme: 'mailto', path: 'cofferynduque5@gmail.com');
    await launchUrl(uri);
  }

  Future<void> abrirEnlace(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Widget _link(
      IconData icono, String titulo, String subtitulo, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.line),
              ),
              child: Icon(icono, color: AppColors.co, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo, style: AppTheme.mono(11, color: AppColors.dim)),
                  const SizedBox(height: 2),
                  Text(subtitulo, style: AppTheme.heading(15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text('Contacto', style: AppTheme.heading(18)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionHeader(
            kicker: '// 03 - contacto',
            titulo: 'Construyamos algo juntos.',
          ),
          const Center(child: Monogram(size: 60)),
          const SizedBox(height: 14),
          Center(
              child: Text('Valeryn Rouse Duque Valladares',
                  style: AppTheme.heading(18))),
          const SizedBox(height: 4),
          Center(
              child: Text('@cofferyn',
                  style: AppTheme.mono(12, color: AppColors.co))),
          const SizedBox(height: 24),
          Center(
            child: AccentButton(
                texto: 'Enviar correo', icono: Icons.send, onTap: abrirCorreo),
          ),
          const SizedBox(height: 20),
          _link(Icons.language, 'SITIO WEB', 'valerynduque.cofferynduque.com',
              () => abrirEnlace('http://valerynduque.cofferynduque.com/')),
          _link(Icons.email, 'EMAIL', 'cofferynduque5@gmail.com', abrirCorreo),
          _link(Icons.chat, 'WHATSAPP', '+58 412 910 9428',
              () => abrirEnlace('https://wa.me/584129109428')),
          _link(Icons.code, 'GITHUB', 'github.com/CofferynDuque5',
              () => abrirEnlace('https://github.com/CofferynDuque5')),
          const CustomFooter(),
        ],
      ),
    );
  }
}
