Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F8175D5D
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839114; cv=none; b=cGQBkJKOGS96sCiMqVB3pFbNwT8mQn2q8b37xPrLL213VVEMTxFzM/LIbQoulvPibbWYIfbyKUqspsz5F2WFNYeWAOueXrGHKThlwm30a4Iu2s5mfnWx5zrn43tjTlheCQIK6KK7IYjiy6FzxjnKIgiqKb5OR8nb9U0ZrEK3S4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839114; c=relaxed/simple;
	bh=YQh4/f65l75A155xplMfJcvtw4A7nt3XcTGv9Hn2GR8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=BsjVHQ4LhxTFTz6JKDYPzqatvPil2IOmvaZEl+P47b5HnvFmQCU+ux8LMJfzbsMPjGuN2dDxvs80ty1CI6JWMnbJ/D3D5dlYSKWlyC2EOD0uPLVZ/jwwTOyNtJf5h8n8uAmdPa7Ybh7S1cBbVYNJts2GCvjTxeoZcemmtbsXZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=CdsOLZLn; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="CdsOLZLn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GlCxbkHbUTVFmNsTnG3DYbTQLnPbRQ3CHvEtet1HMl8=; t=1729839110; x=1730443910; 
	b=CdsOLZLnSPWwvnvyzKgFP1BxWBkFpd790O7ZI4zBePcqptVbpfbSr4PSJU5YU4SZa2wg9hliZex
	FrAG828XKqV8HDedlIh56nmA4I10Hzo+E+ykowCtk4K7DewyfNMOkWz5Di6qtxPCnR7bD4rxlrUXX
	Ukfi1msUao1VRirNITAUNMnjs4XBTkkWAONnnzZGbEVRXTOQVnL3y69YNjIaFOvVPaIR/83TLQK0D
	hDtr/lPIUxJIHIhh1qig78e97diC4MvNjYX4TpGNUi47KLtikLF1TfqOcxcOjGNQWc5FPMDv8thZC
	OuvUEA+VLcidSc5JIrCyq49YhmhUtL6NWEiQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t4E7F-00000001XwX-1HLG; Fri, 25 Oct 2024 08:48:09 +0200
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t4E7F-00000003CYi-0LOe; Fri, 25 Oct 2024 08:48:09 +0200
Message-ID: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
Subject: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>, James Le Cuirot	
 <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Arnd
 Bergmann	 <arnd@arndb.de>, Thorsten Glaser <tg@mirbsd.de>
Date: Fri, 25 Oct 2024 08:48:08 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello,

the m68k port has reached the point where switching the default alignment
from 16-bit to 32-bit is inevitable as the number of packages affected by
alignment issues have become too large. It even includes Python 3.13 these
days.

Since I don't think the situation is getting better by postponing action he=
re
in the future, I suggest that we have a virtual meetup soonish to discuss a
strategy for switching the port over.

Maybe a page could be created either on the Debian or Gentoo Wiki to draft =
a design
for switching over. Geert also mentioned that we should use this transition=
 to clean
up the kernel ABI by removing old syscalls and switch the kernel to asm-gen=
eric which
is why I have included Arnd Bergmann in the CC list.

Please join #gentoo-m68k on Libera if you want to discuss this issue.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
