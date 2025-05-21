Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD5482EB
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747850080; cv=none; b=ni/tFyY9t/6O5PqbKDC/UN/I4dtejSOucHFHTZ6Y3s1I+YRiXZhi6fb2rVr4YtWWSvudL9vPRanZw5XmbWWkEClSnxigsjTOJFYaKFZOd+PmDF2iD49xoY2ovcwZeeIG//mR/d/0dcRhr2EJcMZmuFMRPKpsrJLYruwhqN3WEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747850080; c=relaxed/simple;
	bh=+16tNxkr4xz9q1yrvxQgV8nlJmN/Xv9pLX9peAb7dRc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ohK/sBl3Bu6BjaFrptaYAlBaqpYv1ZYsuYDimGW+w19zkqWQ+rsnTk8x4TQzk9VMQTV2LN7Yh0RBELzW1ZsMn5hSjog8/orAter5kQVmp4yRLocFFH9j7QZZ5UG2xWzz85BLTh7dvc7topW4xlNrtzWQRMyOd5w1tUxnA0E2jCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ODX6Et9x; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ODX6Et9x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=To:In-Reply-To:Cc:References:Message-Id:Date:
	Subject:Mime-Version:From:Content-Transfer-Encoding:Content-Type:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pd4NH4ZwS+O/Y1aJy4BFRty50s9UD5jQfWVbU3cMa4Y=; t=1747850076; x=1748454876; 
	b=ODX6Et9xbP76pgUg+We0FvQKIlvjaV8dIef0JZJTtR7kxflkHTw2e5ybWkbyF4PTC/Kdo9fHfhD
	TXhgjC0niDsQH7CE9VnIOdeSAQRN3NMjaJtHzBSupntkyQ38ieDz9Rmxle70N6iIH3hCzVOzkqV1s
	HUng8WbLhYVYniZ0XCcl/D/KV3jP4fts2sdYbQa4TyMELaXXYnY+mBi6QIRQwhbWu8HFSTiZHI9qj
	PtbEfmtlJbaupwcTQNU3/XHgCqEvQBlvYjhLtRTW9Geys3gaAIkATt9BZ5gYVuW+hCRCiwJjLOcn3
	77z917fLMPopqkokboLEoXuhxmuH9XmvkHPA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHneD-00000002kp7-1pfu; Wed, 21 May 2025 19:54:33 +0200
Received: from tmo-085-235.customers.d1-online.com ([80.187.85.235] helo=smtpclient.apple)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHneD-00000000ax6-0P3e; Wed, 21 May 2025 19:54:33 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Debian subset suitable for m68k (was: Tuple and changes for m68k with -malign-int)
Date: Wed, 21 May 2025 19:54:22 +0200
Message-Id: <F20746B7-7300-4967-8846-2D8BE287CEBC@physik.fu-berlin.de>
References: <0c84a202-2a7c-43c0-8d47-e73c0d9dc9ad@helsinkinet.fi>
Cc: John Klos <john@klos.com>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
In-Reply-To: <0c84a202-2a7c-43c0-8d47-e73c0d9dc9ad@helsinkinet.fi>
To: Eero Tamminen <oak@helsinkinet.fi>
X-Mailer: iPhone Mail (22F76)
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Eero,

> On May 21, 2025, at 4:16=E2=80=AFPM, Eero Tamminen <oak@helsinkinet.fi> wr=
ote:
>=20
> So to start, here are the things that are, and are not, relevant for me _o=
n m68k_.  I.e. _personal_ opinions. First some general principles, and then f=
ew examples.
>=20
>=20
> Relevant
> --------
>=20
> Base system, compilers, interpreters, misc tools, some graphics, and thing=
s shared between niche/retro communities (like m68k) in general.
>=20
> In my case, for example:
> - Kernel
> - Busybox
> - Gcc
> - G++
> - Lua
> - Python
> - La/TeX
> - SDL1
> - ScummVM
> - Wired networking
> - w3m, links, lynx etc
> - Small niche windowing systems
> - Slimmed-down Debian essentials
>=20
>=20
> Not relevant
> ------------
>=20
> Modern corporate backed software, and anything needing encryption or GPUs s=
upporting GLES2+, I get enough of those on x86 Linux. They are too slow / la=
rge for m68k platform, and frankly boring, all something I try to avoid in m=
y hobbies. :-)
>=20
> For example:
> - Java & C#
> - LibreOffice
> - Chrome/ium, Firefox, Webkit
> - Modern desktop environments (KDE, Gnome...)
> - libSDL v2 & v3, and things depending on them
> - Wireless & VPN support
> - Virtualization
>=20
>=20
> Potentially relevant
> --------------------
>=20
> Some of the new tech, especially when it relates to smaller setups and bas=
e system, and more lightweight GUI apps, might also be of interest at some p=
oint:
> - Wayland / Weston
> - Golang
> - Rust, Zig
> - Abiword, Gnumeric, Evince (non-Gnome versions)
> - LyX (LaTeX GUI)
>=20
>=20
> Any thoughts on the above principles?
>=20

The problem is that you assume that we can easily build and maintain a subse=
t of Debian packages without investing a lot of time and effort.

However, I do not intend to maintain a custom version of Debian. I want to b=
uild the vanilla version of Debian unstable because I do neither have the ti=
me nor the resources to roll my own version of Debian.

And using vanilla Debian unstable means having to build all of these package=
s that you are trying to avoid because you think they=E2=80=99re bloated or u=
seless.

And, as for Rust, an increasing number of Python packages such as python-cry=
ptography embed Rust code, so the decision whether we should support Rust or=
 not has already been made.

If you think it=E2=80=99s worthwhile to maintain a custom Linux distribution=
 for m68k, you are free to do that. However, it=E2=80=99s not the work I am i=
nterested personally.

Adrian=

