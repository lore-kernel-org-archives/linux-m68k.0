Received: from mail.venturex.pl (mail.venturex.pl [141.95.86.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C392C34A3C1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Feb 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.86.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770280549; cv=none; b=PSpI/5j0T9J7K5Ooi/wY5qDEPDXr/MNQnTGVIQOdgIXXT3ZgPMkndzxurLKeTtFcXsfkhcS5NHW3LMgfmsOMwvGvQs2dDAbnhsStd2SNex9DaEpXaM2z0TeWErfaovY9U/s97nq49qnDHx0I87RZxzyAq5ZcldSU93af4TfdCJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770280549; c=relaxed/simple;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=NQ8Wj37I2DOfIehRf8mLlUUVENbMV0JrM0vj/kCfyRoXuilPib/eDbGyYbK7e/5BMs0pr3xlYXRXtONd979mKISDVOiL3APWPRH77Rui8hyl4bVsyRxLRO4y7PK14E7K5PYtQx2NYB09kLVf9u69e+Gm8VWMIT/YVAVg32F9TS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl; spf=pass smtp.mailfrom=venturex.pl; dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b=BQPjWA/v; arc=none smtp.client-ip=141.95.86.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=venturex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b="BQPjWA/v"
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id BE9DE2199C; Thu,  5 Feb 2026 09:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770280540; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=BQPjWA/vIBm3Qeyv/hzFKeBZa8+Lo4DZ2ImLftNpMKcbF8F/c48DEtU5+5GrCM6JD
	 BwcpmzksqUXM8e+2cBK69geBw/Xc5ZvNrr8YXiGYlg9iTFGDEQ+b/m8lcceJG+ayVK
	 mdy0S82m8JgiFX2wn/ldEttjAzqXdKvwoos8tCfEJwDn5VfPSonw0VSprbDaxdXWwO
	 lw4w2+fJ1C8KrmFlsQqQCJvqkxzgo8ta9pO7ySsakk+9bcecEGORpsYsED6CYGLi+R
	 A8vpHDUe28DvAYgQ8NMtvWv1J1pFsXX5molrC8cs2WwJXAodOjk4XsGOX0Ga+EnhML
	 e+NPCbBSdk+rA==
Received: by mail.venturex.pl for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Feb 2026 08:35:40 GMT
Message-ID: <20260205084500-0.1.ci.2jdo4.0.06nmgf2i47@venturex.pl>
Date: Thu,  5 Feb 2026 08:35:40 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-m68k@lists.linux-m68k.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Szanowni Pa=C5=84stwo,

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak
