Received: from herc.mirbsd.org (bonn.mirbsd.org [217.91.129.195])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39648C2E0
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 03:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.91.129.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729999345; cv=none; b=udMJCEa1cnArHoFIlGoVp7mX5lFiQY4woaqDKP2YvAMgjEw4Z6E0qWvg8nHfh2Ceta53uBmYjvRrwPmLLsILelBuwhRzth7p/+Q8TVj4VoKiX736dYEg/afXl28A8qTrtqm3OxuXdlxrGt+9XgATCI6AjVLADt5uSnMD9HX83os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729999345; c=relaxed/simple;
	bh=7Rv/nlr1jOjZ7avSSPyngyHHdon+rE5HhbVYNx67wMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SbvNeu2jlE7V6yaz8RH1pMDYAIXSyMhHQSEPSA75h/REZyge+lguV1WDU/PQVwQ/qV1D5Z9seL7EDo3gv2q/rDVTk/neTODShjMjt18qiq2YHtJoP+5OWn8bytl7WZUwi5bgbUGapiBfWdNkHI/jFkZOC8J5XSMD9mMncEffCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.91.129.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from herc.mirbsd.org (tg@herc.mirbsd.org [192.168.0.82])
	by herc.mirbsd.org (8.14.9/8.14.5) with ESMTP id 49R38ESr023413
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 27 Oct 2024 03:08:20 GMT
Date: Sun, 27 Oct 2024 03:08:14 +0000 (UTC)
From: Thorsten Glaser <tg@debian.org>
X-X-Sender: tg@herc.mirbsd.org
To: Finn Thain <fthain@linux-m68k.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>,
        debian-68k <debian-68k@lists.debian.org>,
        James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
Message-ID: <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Finn Thain dixit:

>> >That seems to imply that someone requires that those packages are=20
>> >ported.
>>=20
>> Yes, we do. Rust especially is killing the entire FOSS ecosystem.
>>=20
>> These all are conditio sine qua n=C5=8Dn when it comes to continuing
>> Linux/m68k, as a whole.
>
>I think that's overstating the case. Alternatives to rust are available=20
>and will be for the foreseeable future. Most notably,=20

That=E2=80=99s not the point. Google, for example, are aggressively funding
people to throw away perfectly working code and rewrite it in rust,
or to at least add rust to projects. librsvg has been such a case for
some time already, python-cryptography is, but now we=E2=80=99re losing eve=
n
freetype (!!!) and, possibly, even the Linux kernel.

>https://gcc.gnu.org/wiki/RustFrontEnd

That=E2=80=99s assuming it can build the same stuff the same way so it can
be used in packaging.

>I expect alignment assumptions like that will end up putting more=20
>platforms in the same predicament in future.

No, all the other platforms use natural alignment.

>"Natural" alignment is meaningless in the context of portable data
>structures, as they exist without reference to any particular integer

Yeah, but in practice, all we have is ILP32 and LP64; the Windows=C2=AE
world has LLP64 in addition. And natural alignment just means that
all the data types=E2=80=99 alignment is their size. (Which kind of makes
sense, so you can read them without getting an unalignment trap on
SPARC or so.)

>Q. What is the size of this struct, assuming baa.b is naturally aligned?
>
>struct baa {
>        int a;
>        long long b;
>};

For ILP32, LP64 and LLP64, it=E2=80=99s 4 (a) + 4 (padding) + 8 (b) =3D 16 =
chars.
More importantly, and relevant for Qt, struct baa is also 8-byte
aligned, and malloc(3) results are usually 8=E2=80=91 or even 16-byte align=
ed.

bye,
//mirabilos
--=20
Gestern Nacht ist mein IRC-Netzwerk explodiert. Ich hatte nicht damit
gerechnet, darum bin ich blutverschmiert=E2=80=A6 wer konnte ahnen, da=C3=
=9F SIE so
reagier=E2=80=99n=E2=80=A6 gestern Nacht ist mein IRC-Netzwerk explodiert~~=
~
=09(as of 2021-06-15 The MirOS Project temporarily reconvenes on OFTC)
