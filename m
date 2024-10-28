Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362038C11
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 03:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730085551; cv=none; b=WUMcMSg/vIlo7jYhjO1A1BiiBpfd+LblNm+irXZdFZ2+N6/PfwSaGDUY9J6/UqsBPqeg4koCj8lPVfz7QuaPu2lipTMAP94tJxEXyxasTmMTtcsp3aBqDa7LTsQ8NSqoeITB97bg/sD3K0IxnHL43L9JFKRX1vaau32syvyfeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730085551; c=relaxed/simple;
	bh=wCK3VCqsj+mJMB1IZel52LwDGj9y1K4MtGDNxzwT/sg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HX9PcEC9zGcU9O5MKDEgyJZFQMrFjBw+87tiNCt9ifgMidgr9VvmEDZ7LTnxKltqVUtRu4S/ZgPDqSWwEuGmXSkNw+vq3TZZFQ8E85t9zwsjqVpEM3N8alyDzBEe5dGsfIJ2agGUfGsCOZzEGV8yV0Tv5yys7B0FF2Fc1eGtx9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (2001-4dd7-49d4-0-21d-e0ff-fe77-c17b.ipv6dyn.netcologne.de [IPv6:2001:4dd7:49d4:0:21d:e0ff:fe77:c17b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id CC7971000DB;
	Mon, 28 Oct 2024 03:19:06 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id D8E97143471; Mon, 28 Oct 2024 04:19:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id D3E94143275;
	Mon, 28 Oct 2024 04:19:05 +0100 (CET)
Date: Mon, 28 Oct 2024 04:19:05 +0100 (CET)
From: Thorsten Glaser <tg@debian.org>
To: Arnd Bergmann <arnd@arndb.de>
cc: Andreas Schwab <schwab@linux-m68k.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
Message-ID: <b822873b-f0b5-ed42-9dfa-77581dc9ae1f@debian.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de> <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
 <874j4z253e.fsf@igel.home> <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 27 Oct 2024, Arnd Bergmann wrote:

>I think it makes sense to go through these anyway and annotate
>them to document and enforce the alignment we actually want

That would be good in general, yes. I=E2=80=99d personally argue for
using explicit padding members (please do NOT use __unused,
rather __pad1 __pad2 etc. or __unused1, etc. as __unused is
used (hah) by BSD code for the GCC attribute a lot) and in
cases where n=C5=8Dn-natural alignment is needed, GCC __packed__
plus explicit padding. That is easier to read than __aligned__.

TIL that GCC has a __warn_if_not_aligned__ attribute now,
which could be useful, but mostly for the code that makes
these assumptions, so not us here.

>padding. If all of them get fixed alignment, this would allow
>switching -malign-int on independently for userspace and
>kernel without changing the ABI. Any duplicated copies of
>the struct definitions in userspace of course would need
>the same changes.

That is=E2=80=A6 an interesting side effect and probably a good idea
to decouple this=E2=80=A6 unless there are any *other* kernel-side
changes we absolutely need for this that we don=E2=80=99t want to put
atop via evolution, not revolution (i.e. whether there is any=E2=80=90
thing in the kernel/userspace boundary that direly needs to
change, for this or anyway, and is a breaking change=E2=80=A6 though
maybe even then).


On Sun, 27 Oct 2024, Greg Ungerer wrote:
=20
> There is plenty of Linux on ColdFire, but all the m68k'isms apply the sam=
e.

Ah, okay. All of it nommu though?

Is there anything special we need to do or must not to that
relates to ColdFire? Anyone to put in the Cc list for that?

bye,
//mirabilos
--=20
>> Why don't you use JavaScript? I also don't like enabling JavaScript in
> Because I use lynx as browser.
+1
=09-- Octavio Alvarez, me and =E2=A1=8D=E2=A0=81=E2=A0=97=E2=A0=8A=E2=A0=95=
 (Mario Lang) on debian-devel
