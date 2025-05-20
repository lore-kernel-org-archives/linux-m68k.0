Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E051268698
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734211; cv=none; b=aF2gLeAK8/0URRy8TXynoJVhdoRlraWNaljKOOx7CYsR6yC2EjaYcTYaoioIyXaePfD74DrmwVF09YiKQolRval8ojmAAzQsT+c4Oh1mVi5K39Ubso4cuFn4cZAhlJGCN/x2pGl6QxkGoC1pKMLHQE8EneRB+UoquzfHHbfxy5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734211; c=relaxed/simple;
	bh=Q+yuuHBNG8f/hOJrKOior1OxTnkMTxBS3hKBzjLu8pc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rvkzdGeplCzstnuKTUrh8DmySTqMs4HMYemUMsgwDoXbh5zHbAcs/hBL+OpEDMGfMi7axH/BG2xe0wagxVkA8fb7R0a8H23Le6EpoM5GdbPgpbpSagDCP+vWAzYacmPRqV1TP/1H0IwrR1nTlxgo7nbSOQt2cR4AqxKzcoBX610=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=UITUyFCf; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="UITUyFCf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4HlaosinjC03lDih6/cfInHYGhlrQ1wzXCiCwOa6HVc=; t=1747734209; x=1748339009; 
	b=UITUyFCfm3WCjUUZ6iwUMZakKgmkF316CbLul0x/+lVSIYBHW6APbemrxwXPcHCe0CJUJhvBwrE
	TiO0Of0AoExoxLuH3Im2gLgKP8GFipJoghEWoSNThIVTAhhTjQBpEZVvl44boTVU/AnWNaKSVDirn
	5OjzGHGbKRsQW8s+RBqAPSVWWe/neOaIw3eLdoGZ7X1WbtHHEHeUBTcvtLUEeC+EMlh3TqqikSw6v
	cR/+ihLZ0vqqnZ4xuXOBOcPAQ5DnFrnbgpK5IojPr8qKx74JtKZWQq5GjlkMTWbEwVdKOOIjg2hbU
	YlM7+si9uqE0PwK2E3u/py41NecAtdWwTdEQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHJVO-000000016t0-0CWy; Tue, 20 May 2025 11:43:26 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHJVN-00000003xsa-3LOP; Tue, 20 May 2025 11:43:25 +0200
Message-ID: <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Florian Weimer <fweimer@redhat.com>, James Le Cuirot	
 <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, Libc-help
 <libc-help@sourceware.org>
Date: Tue, 20 May 2025 11:43:25 +0200
In-Reply-To: <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	   <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	   <8734d1kofn.fsf@oldenburg.str.redhat.com>
	  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>
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

On Tue, 2025-05-20 at 19:39 +1000, Finn Thain wrote:
> Qt is an optional dependency of cmake, subject to USE=3Dgui on Gentoo, as=
 it=20
> should be. If that dep is required by Debian, that's a distro problem, no=
t=20
> an ABI problem.

I'm talking about Debian, not Gentoo. And as you admit here, you have to
cripple functionality to make it work which is not what I am interested in.

But if you're using Gentoo anyway, I don't understand what you are even
complaining about. As you heard, Gentoo wants to introduce a new tuple for
the change.

Thus, you can continue to use Gentoo with 16-bit alignment just fine and le=
t
anyone else who needs 32-bit alignment move on.

> As for gccgo, has that ever worked on m68k?

Yes.

> > Furthermore, more and more packages are being ported to Rust which mean=
s=20
> > m68k will either die a long death or have to switch to 4 bytes=20
> > alignment.
> >=20
>=20
> Other language runtimes work fine on the m68k ABI. Why is Rust special?

You mean other languages such as JavaScript, Go, Java, Python and WebKit?

No, they don't work fine on m68k.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
