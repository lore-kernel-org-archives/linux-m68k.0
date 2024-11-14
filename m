Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508261AF0C9
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731622406; cv=none; b=azKvrzgosMZWjzjFxb6Hf77RB86H6FaRdN7W+vYYGrQqnVShFPY07mGOkiSGC1llJWZepaQxuR8u57QugaMqI67tAmS9mi5ybScbZPV4X3HRqE0QIo/83IoQYX45aoiqAmyBeQf57fZVk9a2qFYfj9Rk+fJnjIGNL+G6K0r9HdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731622406; c=relaxed/simple;
	bh=gUjnF+vybe/9+JVOISoWfO3+NU6mSep6y+qG14+sxN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GTzFcpgMlNMr1ItxENxQxQGUIrIPII8MWdPYe4piiCZWDAqeYH6CL6eo+Q4igMPeRVBeTPtycWuAzFDAb7vKRNxOWEbTm4/5kExFXkczXRbije1N32m42M7xK/T30K+UeYI7oOVWh5ab6NiU58dj0K0jF2hTxZ2UOAGDEuCi4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (2a0a-a540-3050-0-21d-e0ff-fe77-c17b.ipv6dyn.netcologne.de [IPv6:2a0a:a540:3050:0:21d:e0ff:fe77:c17b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 138521000A9;
	Thu, 14 Nov 2024 22:13:16 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id CD5D1142956; Thu, 14 Nov 2024 23:13:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id C8C95142955;
	Thu, 14 Nov 2024 23:13:15 +0100 (CET)
Date: Thu, 14 Nov 2024 23:13:15 +0100 (CET)
From: Thorsten Glaser <tg@debian.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <CAMuHMdUSy1zCyUV9NYyy4CT3qTYJkV0G4REtfjROEWsTc53RuA@mail.gmail.com>
Message-ID: <62306047-fd95-8f06-fc71-9547ff9bed0b@debian.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de> <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
 <CAMuHMdUSy1zCyUV9NYyy4CT3qTYJkV0G4REtfjROEWsTc53RuA@mail.gmail.com>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 14 Nov 2024, Geert Uytterhoeven wrote:

>On i686 (i.e. gcc -m32 on amd64):
>
>    __alignof__(long long) =3D 8
>
>but
>
>    sizeof(struct baa) =3D 12
>    __alignof__(struct baa) =3D 4
>
>???
>Isn't the alignment of a struct the largest alignment of any of its
>members?

I=E2=80=99d say yes. Probably the i386 psABI is so old that it is very
weird and n=C5=8Dn-standard in some ways.

>> (Another question: does -malign-int switch to natural
>> alignment for all types, i.e. 64 bit for llong and double,
>> etc. or are we going to have to change GCC first as well
>> to avoid more surprises?)
>
>It only changes alignment for short and larger from 2 to 4 bytes.
>So long long and double are still aligned to 4 bytes instead of 8.

Hmm hmm.

>If we decide to change alignment, I'd rather change all types to
>natural alignment, to avoid future nasty surprises.

That was my thought; the question is whether toolchain maintainers
(upstreams) will be amenable and helpful.

>What to do with long double, which is 12 bytes on m68k and i386?
>I386 kept its alignment at 4, while amd64 changed both size and
>alignment to 16.

amd64=E2=80=99s long double is an SSE2 data type whereas i386=E2=80=99s is =
actually
an 80387 data type (same as m68k=E2=80=99s really), so they aren=E2=80=99t =
comparable.

I=E2=80=99d probably suggest aligning long double to 8 octets, like double.

It=E2=80=99s not a common data type (and probably one best avoided) anyway.

bye,
//mirabilos
--=20
(gnutls can also be used, but if you are compiling lynx for your own use,
there is no reason to consider using that package)
=09-- Thomas E. Dickey on the Lynx mailing list, about OpenSSL
