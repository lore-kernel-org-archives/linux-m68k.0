Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B72FB2
	for <linux-m68k@vger.kernel.org>; Sun, 18 May 2025 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747552396; cv=none; b=UWKZBa5V6a2tyJH6soTup2qWIaXI+zGNa3xkfPveIK1VLouCY8UGWnanyAwFnHguDGs4bjf4LeJpWlrAEMc8RGxa2cB8iWI4HjyTrmQsKBKXP7Olo56hOg0HFZcjd2lsB6ld1Dpn9Gt+IB0UVkU/lO9KQDKWkSwR475ZNVdQAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747552396; c=relaxed/simple;
	bh=eFPFXaYOOUgLf/vRoQy/uQd8tw2Mak+kgfBvLn1Q5Wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSGg57C54ilVweytT2lFvP2Onf9tQVJfCTP/Jo65+c0dNj7y9iPb64yn4svDFKnoyC99jl/Gbgia298rKMjj+xO2EAUe6hsGO06Hb6vVyU7r4X3MwQJgxgGXoUK34M49ZUEP4LfeJ0ZWoAEsPVvSfPkiWI/rI+d1cLAYybEsESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pKs+TEer; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pKs+TEer"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dXUji6rHMWGRCqWETlRuH1gx+FslnOFEmDXbsKNMmM8=; t=1747552392; x=1748157192; 
	b=pKs+TEereeTyqY9rkHoIHGgUH/NaOerg4Wx16FUtEO3peQ66uA3BNnUCazqwxMJJyf1oq6+EEfm
	T7MbikxE66chTf2NJQfQrpE3XjnSyqIWKMcwvCk97440BqAebjyQ60B4RorWtHubCvKUuno3wmGg+
	5khtw7N7NOqudk8z6mGbcbWA+ggmUa+uuLW8s+9XcXB/8tolfrI0+ocwIprPRbpBzCkuMm5YGvxlY
	udHEi5Auz0sHJ019gjHlZVmOaTSNim6QEvpXbRvJ98bWNNOhKS2u248nQNke4L3elwe77qY8Ex4x8
	iGnppSdnKjgpHzO9QawN9ZR4p1vZHZBgdasQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGY9A-0000000380S-0G8E; Sun, 18 May 2025 09:09:20 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGY99-000000044r6-3Vyu; Sun, 18 May 2025 09:09:20 +0200
Message-ID: <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: James Le Cuirot <chewi@aura-online.co.uk>
Cc: libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>, 
 linux-m68k <linux-m68k@vger.kernel.org>
Date: Sun, 18 May 2025 09:09:19 +0200
In-Reply-To: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi James,

On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> Once that is agreed, I'm happy to put together the patch to automatically
> enable the flag for this tuple in GCC. The part I do need help with is
> necessary changes to glibc, if any. Assembly is not my area at all, so wh=
at I
> came up with here was a total guess.
>=20
>=20
> --- a/sysdeps/m68k/crti.S       2022-07-29 23:03:09.000000000 +0100
> +++ b/sysdeps/m68k/crti.S       2022-11-30 21:41:52.710135230 +0000
> @@ -56,7 +56,7 @@
>  #endif
> =20
>         .section .init,"ax",@progbits
> -       .align  2
> +       .p2align        2
>         .globl  _init
>         .hidden _init
>         .type   _init, @function
> @@ -74,7 +74,7 @@
>  #endif
> =20
>         .section .fini,"ax",@progbits
> -       .align  2
> +       .p2align        2
>         .globl  _fini
>         .hidden _fini
>         .type   _fini, @function
>=20
>=20
> I did try this out, and it largely seemed to work, although processes
> occasionally hung. Perhaps this was unrelated.

I was just looking at the necessary changes to switch m68k to 32-bit alignm=
ent
and I'm not sure we need to do anything about glibc. I am documenting my cu=
rrent
findings here [1].

What I have found out so far is that official ELF ABI documentation from AT=
&T
mandates a default alignment of four bytes and any SVR4-based distribution =
such
as Amiga Unix and NetBSD/ELF actually adheres to that. Why Linux uses a 2 b=
ytes
alignment when the official ELF ABI documentation clearly says 4 bytes, rem=
ains
a mystery to me.

I'm not even sure whether we would have to change the target triplet since =
the
current implementation for Linux is actually violating the standard and any
application adhering to spec written for Linux ELF m68k would actually not =
work.

Anyway, looking at crti.s for other 32-bit architectures such as powerpc, I=
'm not
sure we actually need to do anything about glibc. I think just changing the
default value for BIGGEST_ALIGNMENT from 16 to 64 similar to NetBSD/ELF in =
GCC
should be enough, shouldn't it?

Adrian

> [1] https://wiki.debian.org/M68k/Alignment

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
