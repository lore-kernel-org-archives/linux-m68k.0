Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9F2F90E0
	for <linux-m68k@vger.kernel.org>; Thu, 23 Apr 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929988; cv=none; b=tcyDj9NOpxk11dSI9j4N+onRxrLRVzOQ37pc1j/B+DI0R/4DcOXlts8Y+GAJKcT14SWyZShw8skiivjd/SFukcqLa5XXE2SKCmfNQ629LkMuw4Zv9Dx/ZKitZCCcadAT/gr+1EwLXKpPRrGxzNn9tq9RdfeB7tpxGqSOY1KkEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929988; c=relaxed/simple;
	bh=iengdn1LU9AMwXpNY/JHZj2H1XZEzN0F0yCUOnfG1zM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=BkOkfZ0zJ3t1FMQb2tKvyUZVxzgBhPbppVajtIvU4NpVpAnuXzGyAx5o4+5SlE0eIlQWNtJzLtxsNPwf6cvBKuDgxCYbKGWlcRFpcUZAOflaHY/u0yaVkqtDiKg3msQkG/dD1DkDxTVa4ipYLc6jTadoyDH/DCw7e9w1C5isaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=PEdb4L92; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="PEdb4L92"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:To:From:Subject:Message-ID:From:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BNQYhxXLSy8s7Il7bqmpTH7npdNPqbQ5tzYVyeFe1LU=; t=1776929986; x=1777534786; 
	b=PEdb4L92P0OSiFwjDraMiEw5J8QWkPxKfBt199D6wFgXXqoXY0MFHb8U/SuCDec6yB3+PXkKfHk
	4xG8LRbz84nUfD0XBa+6xZEw2fy7S8qtwtWESWObEh7VllHlpCWlLr9tmtl3nP94mJ/2P+CjoM8aI
	ASd9LHVS9ST+/is4mp3B5XFyQkTNBMtfIXoZbNLn0rnU2R9+NrRqoEPtmmIi06L+i04Yr/euwcO0J
	ucKb/ZfFhgTPTBtKvzvmvrGBmjyHY9demraYlGKwiU1uL+/4KlhgQ7kod+9mkPVQWrCSublt2r5yk
	IMcbnZSrr77GQUsqLJVPnGY9Xp+/8aMRUiHQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wFof2-00000003S33-3Y6L; Thu, 23 Apr 2026 09:39:44 +0200
Received: from p5dc559e1.dip0.t-ipconnect.de ([93.197.89.225] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wFof2-00000002cnq-2gm2; Thu, 23 Apr 2026 09:39:44 +0200
Message-ID: <29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
Subject: Summary on what's blocking full Rust support on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, port-m68k <port-m68k@netbsd.org>
Date: Thu, 23 Apr 2026 09:39:44 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello,

here is a quick summary of what needs to be done to get a working Rust comp=
iler for m68k
on Linux. Most of the changes apply to NetBSD as well, except for the align=
ment issues as
NetBSD is already using a 32-bit alignment on m68k by default.

Speaking of which, the default 16-bit alignment on Linux on m68k is still o=
ne of the biggest
blockers for Rust on m68k on Linux and it's also what currently prevents ma=
ny other packages
from being built on Debian unstable on m68k [1][2].

Since switching the default alignment to 32 bits would break the kernel ABI=
, it has been
proposed to make the kernel ABI alignment-agnostic first [3]. This would al=
low the kernel
to be built with either alignment without breaking the alignment. An initia=
l patch series
was proposed by Arnd Bergmann.

Once the alignment issue has been sorted out, the next issue to address is =
the lack of the
M68k backend in LLVM to handle 32-bit offsets for variables and jumps [4]. =
Currently, the
backend will always generate 16-bit offsets which is not enough to compile =
all Rust code,
although some Rust code compiles also with 16-bit offsets.

I have created a rough patch to add support for 32-bit offsets with the hel=
p of Gemini but
the patch has multiple problems as outlined in the GitHub issue in [4]. One=
 of the problems
is that it creates the 32-bit offsets in an inefficient way as if the targe=
t was a ColdFire
CPU. However, the original 680x0 CPUs can actually use more efficient code =
to address 32-bit
variables and jumps. The inefficient way would still be used when ColdFire =
support gets added
to LLVM though [5].

With these changes implemented, all that would be left - to my current - kn=
owledge would be
to update the Rust crates =C2=BBcc=C2=AB [6] and =C2=BBlinux-raw-sys=C2=AB =
[7] to make the Rust compiler build
on Linux on m68k.

If anyone wants to help getting Rust to work on m68k, please let me know!

Thanks,
Adrian

> [1] https://wiki.debian.org/M68k/Alignment
> [2] https://github.com/M680x0/issues/issues/3
> [3] https://github.com/M680x0/issues/issues/6
> [4] https://github.com/llvm/llvm-project/issues/181481
> [5] https://github.com/M680x0/issues/issues/4
> [6] https://github.com/rust-lang/rust/issues/155602
> [7] https://github.com/rust-lang/rust/issues/155603

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
