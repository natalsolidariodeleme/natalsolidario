import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const double totalArrecadado = 0;
const double metaDeArrecadacao = 5000;
const String nomeDaCampanha = 'Natal Solidário Leme';
const String chavePix = '';
const String codigoPixCopiaECola =
    '00020126580014BR.GOV.BCB.PIX013632727282-8ff1-4b97-9ffc-73b9b71475f75204000053039865802BR5923Mariane de Cassia Gallo6009SAO PAULO621405107J8Ni2JmYC63042C4C';
const String linkGrupoWhatsApp =
    'https://chat.whatsapp.com/Gmn7qO9k1SH7vfYuFKMEri';
const String emailCampanha = 'natalsolidario@proton.me';

const Color vermelhoNatal = Color(0xFFC63D32);
const Color vermelhoEscuro = Color(0xFF9F2D27);
const Color verdeAzulado = Color(0xFF2D817B);
const Color verdeClaro = Color(0xFFDCEAE1);
const Color fundo = Color(0xFFF7F1E7);
const Color cartao = Color(0xFFFFFCF7);
const Color texto = Color(0xFF3D211C);
const Color textoSuave = Color(0xFF715B53);
const Color borda = Color(0xFFE8D9C6);

void main() {
  runApp(const NatalSolidarioApp());
}

class NatalSolidarioApp extends StatelessWidget {
  const NatalSolidarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nomeDaCampanha,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: fundo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: vermelhoNatal,
          primary: vermelhoNatal,
          surface: cartao,
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const CampanhaPage(),
    );
  }
}

class CampanhaPage extends StatelessWidget {
  const CampanhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _PaperTexturePainter()),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 920),
                  child: const _CampaignContent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CampaignContent extends StatelessWidget {
  const _CampaignContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CampaignHeader(),
        const SizedBox(height: 22),
        const _FundraisingCard(),
        const SizedBox(height: 20),
        const _DonationCard(),
        const SizedBox(height: 20),
        const _BasketContentsCard(),
        const SizedBox(height: 20),
        const _TimelineCard(),
        const SizedBox(height: 20),
        const _AccountabilityCard(),
        const SizedBox(height: 20),
        const _VolunteerCard(),
        const SizedBox(height: 20),
        const _SafetyCard(),
        const SizedBox(height: 26),
        const Center(
          child: Text(
            'Natal Solidário Leme · Natal 2026',
            textAlign: TextAlign.center,
            style: TextStyle(color: textoSuave, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _CampaignHeader extends StatelessWidget {
  const _CampaignHeader();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 400;
        return Padding(
          padding: EdgeInsets.only(top: compact ? 12 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ('Iniciativa popular e apartidária · Leme/SP').toUpperCase(),
                style: GoogleFonts.lato(
                  color: vermelhoNatal,
                  fontSize: compact ? 12 : 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: compact ? 1.4 : 2,
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: compact ? 38 : 72),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NATAL',
                          style: TextStyle(
                            color: vermelhoNatal,
                            fontSize: compact ? 37 : 58,
                            height: .9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SOLIDÁRIO LEME',
                            maxLines: 1,
                            style: TextStyle(
                              color: vermelhoNatal,
                              fontSize: compact ? 37 : 58,
                              height: .98,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: compact ? 1 : 0,
                    right: 0,
                    child: Icon(
                      Icons.auto_awesome,
                      size: compact ? 42 : 72,
                      color: verdeAzulado.withAlpha(75),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Solidariedade não tem lado',
                style: GoogleFonts.meaCulpa(
                  color: verdeAzulado,
                  fontSize: compact ? 32 : 42,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Jovens de Leme estão reunindo doações para montar cestas '
                'de Natal para famílias da cidade. Cada real arrecadado '
                'vira comida na mesa da ceia.',
                style: TextStyle(color: textoSuave, fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: verdeClaro,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  'Doações até 7 de dezembro',
                  style: TextStyle(
                    color: verdeAzulado,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FundraisingCard extends StatelessWidget {
  const _FundraisingCard();

  @override
  Widget build(BuildContext context) {
    final progress = metaDeArrecadacao > 0
        ? (totalArrecadado / metaDeArrecadacao).clamp(0.0, 1.0)
        : 0.0;

    return _SectionCard(
      title: 'Quanto já arrecadamos',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 390) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CollectedAmount(totalArrecadado),
                    const SizedBox(height: 2),
                    Text(
                      'de ${_formatCurrency(metaDeArrecadacao)}',
                      style: const TextStyle(color: textoSuave, fontSize: 14),
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _CollectedAmount(totalArrecadado),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      'de ${_formatCurrency(metaDeArrecadacao)}',
                      style: const TextStyle(color: textoSuave, fontSize: 15),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: const Color(0xFFEFE3D2),
              color: vermelhoNatal,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${(progress * 100).round()}% da meta alcançada · '
            'Cada doação ajuda a montar as cestas.',
            style: const TextStyle(
              color: textoSuave,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _CollectedAmount extends StatelessWidget {
  const _CollectedAmount(this.amount);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatCurrency(amount),
      style: const TextStyle(
        color: vermelhoNatal,
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: -.5,
      ),
    );
  }
}

class _BasketContentsCard extends StatelessWidget {
  const _BasketContentsCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'O que vai em cada cesta',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 480) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BasketList(
                      heading: 'Básico',
                      items: [
                        'Arroz, feijão, óleo, açúcar',
                        'Macarrão e molho de tomate',
                        'Farinha, café, leite, sal',
                        'Sardinha ou atum',
                      ],
                    ),
                    SizedBox(height: 16),
                    _BasketList(
                      heading: 'Para a ceia',
                      items: [
                        'Panetone ou chocotone',
                        'Suco ou refrigerante',
                        'Milho, ervilha ou seleta',
                        'Gelatina, biscoitos e uma sobremesa',
                      ],
                    ),
                  ],
                );
              }
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _BasketList(
                      heading: 'Básico',
                      items: [
                        'Arroz, feijão, óleo, açúcar',
                        'Macarrão e molho de tomate',
                        'Farinha, café, leite, sal',
                        'Sardinha ou atum',
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: _BasketList(
                      heading: 'Para a ceia',
                      items: [
                        'Panetone ou chocotone',
                        'Suco ou refrigerante',
                        'Milho, ervilha ou seleta',
                        'Gelatina, biscoitos e uma sobremesa',
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 14),
          const Text(
            'A lista final depende do valor arrecadado e dos preços na hora da compra.',
            style: TextStyle(color: textoSuave, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _BasketList extends StatelessWidget {
  const _BasketList({required this.heading, required this.items});

  final String heading;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            color: vermelhoNatal,
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(color: textoSuave)),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: textoSuave,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Etapas',
      child: const Column(
        children: [
          _TimelineEntry(
            date: 'Até 7 de dezembro',
            description: 'Arrecadação das doações',
          ),
          _TimelineEntry(
            date: '8 a 15 de dezembro',
            description: 'Compra dos itens e montagem das cestas',
          ),
          _TimelineEntry(
            date: 'Antes do Natal',
            description: 'Entrega às famílias',
          ),
          _TimelineEntry(
            date: 'Depois da entrega',
            description:
                'Prestação de contas publicada aqui, com notas e fotos',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.date,
    required this.description,
    this.isLast = false,
  });

  final String date;
  final String description;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          child: Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: cartao,
                  shape: BoxShape.circle,
                  border: Border.all(color: vermelhoNatal, width: 2),
                ),
              ),
              if (!isLast) Container(width: 1, height: 40, color: borda),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: texto,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    color: textoSuave,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountabilityCard extends StatelessWidget {
  const _AccountabilityCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Prestação de contas',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: borda),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Depois das compras, esta parte vai mostrar cada gasto com valor, '
          'o total arrecadado e quantas cestas foram entregues. As notas '
          'fiscais e fotos da entrega também serão divulgadas.',
          style: TextStyle(color: textoSuave, fontSize: 12, height: 1.55),
        ),
      ),
    );
  }
}

class _VolunteerCard extends StatelessWidget {
  const _VolunteerCard();

  @override
  Widget build(BuildContext context) {
    final hasGroupLink = linkGrupoWhatsApp.trim().isNotEmpty;
    return _SectionCard(
      title: 'Quer ajudar de outro jeito?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Precisamos de gente para comprar, montar e entregar as cestas. '
            'Entre no grupo da ação e veja como participar.',
            style: TextStyle(color: texto, fontSize: 13, height: 1.55),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: hasGroupLink
                ? () => _openExternalLink(context, linkGrupoWhatsApp)
                : null,
            icon: const Icon(Icons.chat_bubble, size: 18),
            label: Text(
              hasGroupLink
                  ? 'Entrar no grupo do WhatsApp'
                  : 'Link do grupo em configuração',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF25D366),
              disabledBackgroundColor: const Color(0xFFE9E6DE),
              disabledForegroundColor: textoSuave,
              foregroundColor: const Color(0xFF102B1C),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _SafetyCard extends StatelessWidget {
  const _SafetyCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Para doar com segurança',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SafetyBullet(
            text: 'O código Pix oficial da campanha é somente o desta página.',
          ),
          const _SafetyBullet(
            text:
                'Para divulgar, compartilhe este link ou o post original do '
                'grupo, sem copiar a chave em outro texto.',
          ),
          const _SafetyBullet(
            text:
                'Se encontrar outra chave pedindo doação em nome desta ação, '
                'inclusive em grupos de WhatsApp, não pague e avise o grupo.',
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              const Text(
                'Outras dúvidas? Escreva para',
                style: TextStyle(color: textoSuave, fontSize: 13),
              ),
              InkWell(
                onTap: () => _openEmail(context),
                child: Text(
                  emailCampanha,
                  style: const TextStyle(
                    color: vermelhoNatal,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SafetyBullet extends StatelessWidget {
  const _SafetyBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(color: texto)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: texto, fontSize: 13, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cartao,
        border: Border.all(color: borda),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_CardTitle(title), const SizedBox(height: 12), child],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lato(
        color: texto,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

Future<void> _openExternalLink(BuildContext context, String link) async {
  final uri = Uri.tryParse(link);
  if (uri == null || (uri.scheme != 'https' && uri.scheme != 'http')) {
    _showLinkError(context);
    return;
  }
  await _launchUri(context, uri);
}

Future<void> _openEmail(BuildContext context) async {
  await _launchUri(context, Uri(scheme: 'mailto', path: emailCampanha));
}

Future<void> _launchUri(BuildContext context, Uri uri) async {
  try {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) _showLinkError(context);
  } on PlatformException catch (error) {
    debugPrint('Não foi possível abrir $uri: $error');
    if (context.mounted) _showLinkError(context);
  }
}

void _showLinkError(BuildContext context) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Não foi possível abrir o link. Tente novamente.'),
    ),
  );
}

class _DonationCard extends StatefulWidget {
  const _DonationCard();

  @override
  State<_DonationCard> createState() => _DonationCardState();
}

class _DonationCardState extends State<_DonationCard> {
  bool _showPixCode = false;

  @override
  Widget build(BuildContext context) {
    final hasPixCode = codigoPixCopiaECola.trim().isNotEmpty;
    final hasPixKey = chavePix.trim().isNotEmpty;

    return _SectionCard(
      title: 'Como doar',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.favorite, color: vermelhoNatal, size: 20),
              SizedBox(width: 8),
              Text(
                'SEU PIX VIRA CARINHO',
                style: TextStyle(
                  color: vermelhoNatal,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 560) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: _QrCode(hasPixCode: hasPixCode)),
                    const SizedBox(height: 18),
                    _PixInstructions(
                      hasPixCode: hasPixCode,
                      hasPixKey: hasPixKey,
                      showPixCode: _showPixCode,
                      onTogglePixCode: _togglePixCode,
                      onCopy: () => _copyPixCode(context),
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _QrCode(hasPixCode: hasPixCode),
                  const SizedBox(width: 22),
                  Expanded(
                    child: _PixInstructions(
                      hasPixCode: hasPixCode,
                      hasPixKey: hasPixKey,
                      showPixCode: _showPixCode,
                      onTogglePixCode: _togglePixCode,
                      onCopy: () => _copyPixCode(context),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: verdeClaro,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.verified_user_rounded,
                  color: verdeAzulado,
                  size: 18,
                ),
                SizedBox(width: 9),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: texto,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Antes de confirmar, ',
                          style: TextStyle(
                            color: verdeAzulado,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text:
                              'confira o valor e se o QR Code ou o código veio ',
                        ),
                        TextSpan(
                          text: 'desta página. ',
                          style: TextStyle(
                            color: verdeAzulado,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Na dúvida, escreva para o e-mail da campanha antes de pagar.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePixCode() {
    setState(() => _showPixCode = !_showPixCode);
  }

  Future<void> _copyPixCode(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: codigoPixCopiaECola));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Código Pix copiado!')));
  }
}

class _QrCode extends StatelessWidget {
  const _QrCode({required this.hasPixCode});

  final bool hasPixCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borda),
        borderRadius: BorderRadius.circular(12),
      ),
      child: hasPixCode
          ? QrImageView(
              data: codigoPixCopiaECola,
              version: QrVersions.auto,
              size: 162,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black,
              ),
            )
          : const _QrPlaceholder(),
    );
  }
}

class _QrPlaceholder extends StatelessWidget {
  const _QrPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.qr_code_2_rounded,
          size: 82,
          color: textoSuave.withAlpha(140),
        ),
        const SizedBox(height: 4),
        const Text(
          'QR CODE PIX',
          style: TextStyle(
            color: textoSuave,
            fontSize: 9,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _PixInstructions extends StatelessWidget {
  const _PixInstructions({
    required this.hasPixCode,
    required this.hasPixKey,
    required this.showPixCode,
    required this.onTogglePixCode,
    required this.onCopy,
  });

  final bool hasPixCode;
  final bool hasPixKey;
  final bool showPixCode;
  final VoidCallback onTogglePixCode;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            style: TextStyle(color: texto, fontSize: 15, height: 1.6),
            children: [
              TextSpan(text: 'Abra o app do seu banco, escolha '),
              TextSpan(
                text: 'Pix',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text:
                    ' e leia o QR Code. No celular, copie o código abaixo e '
                    'use Pix copia e cola. Qualquer valor ajuda.',
              ),
            ],
          ),
        ),
        if (hasPixCode) ...[
          const SizedBox(height: 9),
          TextButton.icon(
            onPressed: onTogglePixCode,
            style: TextButton.styleFrom(
              foregroundColor: textoSuave,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: Icon(
              showPixCode ? Icons.expand_less : Icons.arrow_right,
              size: 18,
            ),
            label: Text(showPixCode ? 'Ocultar código' : 'Ver o código'),
          ),
          if (showPixCode) ...[
            const SizedBox(height: 6),
            SelectableText(
              codigoPixCopiaECola,
              style: const TextStyle(color: texto, fontSize: 12, height: 1.4),
            ),
          ],
        ] else ...[
          const SizedBox(height: 8),
          const Text(
            'O QR Code e o código Pix serão exibidos após a configuração.',
            style: TextStyle(color: textoSuave, fontSize: 12, height: 1.4),
          ),
        ],
        if (hasPixKey) ...[
          const SizedBox(height: 8),
          const Text(
            'CHAVE PIX',
            style: TextStyle(
              color: verdeAzulado,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          SelectableText(
            chavePix,
            style: const TextStyle(
              color: texto,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: hasPixCode ? onCopy : null,
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: vermelhoNatal,
              disabledBackgroundColor: vermelhoNatal,
              disabledForegroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              hasPixCode ? 'Copiar código Pix' : 'Pix em configuração',
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class _PaperTexturePainter extends CustomPainter {
  const _PaperTexturePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x0F9B7350)
      ..strokeWidth = 1;
    for (double x = 4; x < size.width; x += 8) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

String _formatCurrency(double value) {
  final parts = value.toStringAsFixed(2).split('.');
  final wholePart = parts.first.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );
  return 'R\$ $wholePart,${parts.last}';
}
