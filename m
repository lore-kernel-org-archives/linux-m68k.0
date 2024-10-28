Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33218A924
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 03:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730084888; cv=none; b=a7951OkSu5i+xR4KC5uGW+Rt//yaHFwQOAPGqxzpToF4LIk+kxNeHKOS96UfbeeG5JVcRgpmsMioUgfEji8j5zrG/WC5O6U9LTIMgAnmDpUmTQl33y6BTOz2ISOmrPNlDo++wiY1ei3WZPFJ7dSuPLi/8GJEYZ/WVQNaSGgqAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730084888; c=relaxed/simple;
	bh=k9vlZbYwIu8QZWHazznm4j7jdaOEHgxM5Zejbq07jxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aoSVTWLoHxZBaEVtUVBHFPk8unLPg71hoeyVmtXTU2vkdflEGMEh9g3pAw+nrCbgglblRGL8aVY94weMKY3HPK3atDnYlqpSDLzZEHEsb6nS4MxWees3impqHuHu8ijQPY2kgoE2L/WjB42/SG6qworPY/BDluAH+N0G/vWSvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (2001-4dd7-49d4-0-21d-e0ff-fe77-c17b.ipv6dyn.netcologne.de [IPv6:2001:4dd7:49d4:0:21d:e0ff:fe77:c17b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id AD6861001A5;
	Mon, 28 Oct 2024 03:07:52 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id E3534143471; Mon, 28 Oct 2024 04:07:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id DF144143275;
	Mon, 28 Oct 2024 04:07:47 +0100 (CET)
Date: Mon, 28 Oct 2024 04:07:47 +0100 (CET)
From: Thorsten Glaser <tg@debian.org>
To: Arnd Bergmann <arnd@arndb.de>
cc: Finn Thain <fthain@linux-m68k.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
Message-ID: <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org> <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
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
>On Sun, Oct 27, 2024, at 06:16, Finn Thain wrote:

>>Right. And I don't think the problem is going to go away. One solution
>>that is sometimes raised is better tooling. I'm not sure how that would

No. You don=E2=80=99t understand the problem: applications are being
written that require natural alignment for at least 32-bit and
smaller quantities, some possibly for all quantities even. We
need these applications to work, and we cannot redesign them
(it=E2=80=99s common for them to store flags in the lowest pointer bits
and do other awful things).

Could you please, if you cannot believe it yourself, accept the
word of those actually doing the porting that it is direly needed
in the current Linux ecosystem. Thank you.

>>> That struct is just 12 bytes for you then?
>>
>> Right. i686 and m68k agree on that.
>
>The other ones that have misaligned 'long long' variables are
>
>arc
>arm (OABI only)
>csky
>microblaze
>nios2
>openrisc
>superh
>i386

Okaaay. So, all =E2=80=9Cold=E2=80=9D platforms or with low distro support.
For Debian, we have superh and i386, out of these. It is
entirely possible that Qt et al. can work with this, but
these all have natural alignment for quantities =E2=89=A4 32 bits.

Does Gentoo support more of them? Debian used to have arm
OABI, but that=E2=80=99s ages ago. I know things like OpenADK support
them, but that is very chiefly embedded.

>The 32-bit architectures that use a natural 8-byte
>alignment are
>
>arm (EABI)
>parisc
>mips
>powerpc
>riscv
>s390
>sparc
>xtensa

That=E2=80=99s majoritily represented in Debian. And ideally, we=E2=80=99d
use that for all new architectures.

I have a feeling that GCC=E2=80=99s -malign-int will only push us
into the former. I have no idea whether it=E2=80=99s feasible to
also change GCC for this; that will probably depend on both
the other =E2=80=9Cwhat parts of the toolchain need changing=E2=80=9D and
whether GCC can be switched with little effort.

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes a m=
aster
22:21=E2=8E=9C<asarch> And the distance between the craziness and geniality=
 is
only measured by the success 18:35=E2=8E=9C<asarch> "Psychotics are consist=
ently
inconsistent. The essence of sanity is to be inconsistently inconsistent
