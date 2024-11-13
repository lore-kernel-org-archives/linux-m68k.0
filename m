Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5342AA9
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731534170; cv=none; b=GEyRGazw1Culi6zVp3028x+HQx8cWbxNYVoAQIHlGWbq86FiS+jgRVbbW9aEu6CEjX2JAZFvSrIXC6vN3kTwaHY9aaq6voIYZfx5QwALwODaJmtoeHkn2luQ8OjMRHtjqlZrNCWLZyOYhxk5pdFu3ccGbFOzD5GwjVZBQHfn6to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731534170; c=relaxed/simple;
	bh=b6kl68pWHkCuogwXp5saQDTShAmdNatlHgN4jN5qzMs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=meGilgADqUYYn5/SzDnyX7Qq20KZbf83D1p7ZhBn9ByzWl4SMJnxDpG2jnSTb0gcYSvyrBJpKoO/rz6ieSOEi8jHkaO+ZWDgI2HfcA2JOQpHfpRtiOYWKw7GpJhTRUbRk+pkGmXv8gisuK0QzOLDZQBvHC+YzRMRXaRdJ35YyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (xdsl-212-8-144-112.nc.de [212.8.144.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id C28CA100195;
	Wed, 13 Nov 2024 21:33:06 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 8EB24142956; Wed, 13 Nov 2024 22:33:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 89027141D48;
	Wed, 13 Nov 2024 22:33:05 +0100 (CET)
Date: Wed, 13 Nov 2024 22:33:05 +0100 (CET)
From: Thorsten Glaser <tg@debian.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
Message-ID: <a600d9a7-f068-2d5e-8e81-116127e61dc4@mirbsd.de>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>  <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>  <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
  <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com> <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

(please keep my debian.org address in the distribution list,
not the mirbsd one, as it has better chance to interact with
other mail providers out there for this=E2=80=A6 except Googlemail,
which, of course, is no proper mail provider and actively
disrecommended because it fails to collaborate for FOSS work)

On Wed, 13 Nov 2024, John Paul Adrian Glaubitz wrote:

>On Thu, 2024-11-14 at 07:36 +1300, Michael Schmitz wrote:
>> I didn't say that - just supporting Arnd's point that much of the RAM
>> constrained old m68k software won't benefit from today's user space.
>
>We're talking about an open source stack here. No one is going to run an
>old binary from the 80s on a current system. And if you want to run old
>software, you're certainly also not running the latest kernel.

Indeed.

We should consider something with 256 MiB RAM the =E2=80=9Cdefault=E2=80=9D
(which also matches the usual =E2=80=9Csmallest VM=E2=80=9D; there are VMs
with just 128 MiB RAM, but even just running apt-get update
can stretch them to swap) and, perhaps, try to keep systems
with 64 MiB working, perhaps with custom kernels. But 256 MiB
is plenty for a normal OSS stack (i.e. no dbus/systemd, proper
classical init), without X11 anyway, but perhaps even with it.

>SysVInit uses a huge set of bash scripts where every action involves spawn=
ing

sh scripts, mksh=E2=80=99s /bin/lksh gives a 3=C3=97 speedup, compared to
GNU bash, here, probably even more, as it=E2=80=99s statically linked.

[ low memory ]
>Again, the problem is not Debian-specific. Heck, it's not even Linux-speci=
fic.

ACK.

>> If this involves changes at kernel level (syscall parameter alignment?)
>> however, my recommendation would be to rather drop the port than end up
>> with new kernels no longer backwards compatible with old user space.

I don=E2=80=99t buy this.

But, as has been pointed out, if we make the current alignment explicit
everywhere, the kernel ABI does not have to change=C2=B9. And new syscalls,
ioctls, structs, etc. can just be made with natural alignment in mind
(I bet most are already anyway) and with padding assumptions made expli=E2=
=80=90
cit (which again probably is done already anyway).

=E2=91=A0 not for the userspace ABI to change, anyway; that can be decouple=
d
  is the point here

bye,
//mirabilos
--=20
11:56=E2=8E=9C=C2=ABliwakura:#!/bin/mksh=C2=BB also, i wanted to add mksh t=
o my own distro =E2=94=82
i was disappointed that there is no makefile =E2=94=82 but somehow the Buil=
d.sh is
the least painful built system i've ever seen =E2=94=82 honours CC, {CPP,C,=
LD}FLAGS
properly =E2=94=82 looks cleary like done by someone who knows what they ar=
e doing
