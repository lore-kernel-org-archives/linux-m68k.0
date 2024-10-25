Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC6217F23
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729892823; cv=none; b=tcsh2i0k/4oF2FyZqnBWtHxDoORfTBp4xgZo7Cdyqd5unmNewWb2wIKNT8QB3H7iMOiVi3dWUlkfVAqDzGY1AxhrXBHDNTp5V9AwNaMa0eRiGbbRFMHSg5JRVa0vZphUz3VqD61c5ssHQrOzDTuXLsGsnNLQIoQ2zGMblDhYFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729892823; c=relaxed/simple;
	bh=0tOrrpMRVkbfFQCOM1QyEztm5IGe9t74s98/hg3SCIU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZteuiSOW4iAdou2qcEF3diFLXpOLER91gEwuPgUBtlxrJBKIeuiJR6VOP2HryVear3LyLypiZZUsZurAYMSSOee2HeLDTZ3QMxL6P0x5fMBp33FH98wWcu+fVlpRApZFeZC4my5b3Z5gc5xbY2Pv6lfwSaIaj5zDVnTpPFGz85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (xdsl-78-35-214-175.nc.de [78.35.214.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 60DE41001A7;
	Fri, 25 Oct 2024 21:38:46 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 57AE0143471; Fri, 25 Oct 2024 23:38:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 53C9C143275;
	Fri, 25 Oct 2024 23:38:45 +0200 (CEST)
Date: Fri, 25 Oct 2024 23:38:45 +0200 (CEST)
From: Thorsten Glaser <tg@debian.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
Message-ID: <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:

>as m68k has supported 32-bit alignment through the "-malign-int"
>switch for a long time.

That switch constitutes a fundamental ABI change, even if
the effect is limited.

Question is, do we need a kernel change for this at all?
Is there anything in the kernel/userland interface that
gets affected by this, or do these APIs use sufficient
explicit padding? Has anyone looked at this?

If we know that the answer is no, the plan could look
different from a yes answer, so=E2=80=A6

Additionally=E2=80=A6 has anyone done the simple =E2=80=9Cenable -malign-in=
t
in GCC, begin rebuilding stuff, first glibc, then others,
see what breaks=E2=80=9D? Is there sufficient effect that we cannot
incrementally change over?

(Another question: does -malign-int switch to natural
alignment for all types, i.e. 64 bit for llong and double,
etc. or are we going to have to change GCC first as well
to avoid more surprises?)

bye,
//mirabilos
--=20
Solange man keine schmutzigen Tricks macht, und ich meine *wirklich*
schmutzige Tricks, wie bei einer doppelt verketteten Liste beide
Pointer XORen und in nur einem Word speichern, funktioniert Boehm ganz
hervorragend.=09=09-- Andreas Bogk =C3=BCber boehm-gc in d.a.s.r
