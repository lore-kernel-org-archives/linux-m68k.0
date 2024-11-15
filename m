Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F2CA5B
	for <linux-m68k@vger.kernel.org>; Fri, 15 Nov 2024 01:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731633891; cv=none; b=cH2K9kwGAKr1JJ4ecxt/kNaWHg6AfOdLl4xJn9kKh7dqiA3XNGjwCSMxBxuTq/AXkL9sPYH2QxMLQncWMZnCqyk1p/GnoQiBq37t287dY63bU0E5YuF8zwlvH7i3+/hyVOfqnnxGfAKkqKZsJy/Pc9XgN3bzvXGWBWoBtCpk4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731633891; c=relaxed/simple;
	bh=F6zYEw0NJZh9PkkSLsCJiecnBoTqiEa80ledUdhIKnM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FLbXViNS0DPfYQ5OPj9ldvRdymqbEYN5rYBnHb1BMxPNgS7uwZz64Tpsg9KfbF5zLQS0ulG/H5L6JiTyjMvGiIZOHSNKL9uUpvWg3VMv81i32QD3AXK/r+Uu+LofNBqEiVXAKou0dQSyFHPPpqSsmKB7nLbtRxvQl+IHtl7cW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (xdsl-212-8-144-112.nc.de [212.8.144.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 623061001C1;
	Fri, 15 Nov 2024 01:24:47 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 665A0142956; Fri, 15 Nov 2024 02:24:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 60F19142955;
	Fri, 15 Nov 2024 02:24:46 +0100 (CET)
Date: Fri, 15 Nov 2024 02:24:46 +0100 (CET)
From: Thorsten Glaser <tg@debian.org>
To: Finn Thain <fthain@linux-m68k.org>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <d4e59a96-9d1e-94ca-313a-b577338d9d6f@linux-m68k.org>
Message-ID: <c0b6613c-22c7-674b-f6ff-9a5c36f09732@debian.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org> <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com> <d4e59a96-9d1e-94ca-313a-b577338d9d6f@linux-m68k.org>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 15 Nov 2024, Finn Thain wrote:

>On NetBSD/m68k I get,
>
>sizeof(struct baa) =3D=3D 16
>__alignof__(long long) =3D=3D 8
>__alignof__(struct baa) =3D=3D 8

That makes sense.

>> Isn't the alignment of a struct the largest alignment of any of its memb=
ers?
>
>Sometimes...

I think I have a rough idea why i386 is weird here.
It famously can misalign, and it probably loads the
members as two separate dwords, being a 32-bit CPU,
and does not offer atomics for it, and so the initial
psABI decided to do that. Or something. If it helps,
it=E2=80=99s just as weird on MirBSD/i386, where this was no
deliberate decision.


tg@fish:~ $ ./a.out
int     s=3D4     a=3D4
llong   s=3D8     a=3D8
baa     s=3D12    a=3D4
baa.a   s=3D4     a=3D4     o=3D0
baa.b   s=3D8     a=3D4     o=3D4

vs.

(pbuild22802-bookworm/i386)root@cafe:/tmp# ./a.out
int     s=3D4     a=3D4
llong   s=3D8     a=3D8
baa     s=3D12    a=3D4
baa.a   s=3D4     a=3D4     o=3D0
baa.b   s=3D8     a=3D4     o=3D4

vs. (Linux/amd64)

tg@x61p:~ $ ./a.out
int     s=3D4     a=3D4
llong   s=3D8     a=3D8
baa     s=3D16    a=3D8
baa.a   s=3D4     a=3D4     o=3D0
baa.b   s=3D8     a=3D8     o=3D8


But we certainly need to avoid following the other special
case and rather design the post-switch ABI so that it is
as easily handled as any other new ILP32 ABI for another
architecture, when we change it already anyway.

Two questions:

=E2=93=90 if Clang+LLVM doesn=E2=80=99t know -malign-int anyway, and if its
  capability to output code for m68k is experimental to
  n=C5=8Dnexistent right now, do we even need to take it into
  account? Perhaps changing it to always use the new one is good.

=E2=93=91 what does NetBSD do to get the result (considering that
  -malign-int supposedly only changes int to 4), patch GCC?

Of particular interest are a couple definitions in=E2=80=A6
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/config/m68k/netbsd-el=
f.h;h=3D3d2043bbe7087ac58f0d2c4336734f7a37bba02f;hb=3DHEAD#l269
=E2=80=A6 versus the arch defaults in:
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/config/m68k/m68k.h;h=
=3D0d57199714361ff9ed7f92ef28e36f71aee326b3;hb=3DHEAD#l290

With a bit of luck this means that raising BIGGEST_ALIGNMENT
is sufficient to give us 8-octet-aligned doubles and long doubles.
Then we =E2=80=9Cjust=E2=80=9D need to raise the other definitions that ind=
icate
16-bit alignment to 32. (TARGET_SHORT is -mshort is I16LP32 and
so doesn=E2=80=99t need consideration for Linux/m68k.)

I=E2=80=99m not sure anything needs to have 128-bit alignment that won=E2=
=80=99t
explicitly specify that via attributes.

bye,
//mirabilos
--=20
Yay for having to rewrite other people's Bash scripts because bash
suddenly stopped supporting the bash extensions they make use of
=09-- Tonnerre Lombard in #nosec
