Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4764A8F
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730286; cv=none; b=cESPF6N4LxLoYdBSO4rEYFkoY5OdgtQbUyYFWwOO8Upx0MH2/T9y90ojIw8xoUlB1PoheuvSOkI4nfIZgvJmE202QI3ovV8Blpff54oDF/xoNnCxUUxCBtmXz2pRuFNHmU6aEXnaiHN3iq0609Y1ohNl9yuZ7vhKzxIikBB7KLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730286; c=relaxed/simple;
	bh=OsVBKijR8tOthW/9zeIBe4q/8xh6u+qFzhu+L/gsY/M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGAgo/suO93E7F6Ld5mC6EtGZuDfmbeQxhHP8LGkZQ5yPr8Q+vNiln9FTSCvl/Uk6y6d9EbYJwfszdRAZCwyUGQqKMVUqW2vJpilgIjIAj3hm7p8RuHvBV473xqhP8J7KdihfySCIUyHqBBIMNqkjZn8VI4MgL1nIsfz33Vy+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=jka4yyJi; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="jka4yyJi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CPnAt4D1VAwG4JLgKv86wjmCu1pvmLXxV6R2kNU/D3M=; t=1747730282; x=1748335082; 
	b=jka4yyJiTCDuehkRTEHRcTrEAupmrfccXejP2exgEkWWhITTZ1DFP9S64DMTYaEz7CBHRa7SKpW
	X8i0EDNreQVo80My54whlp5IQrA6Bblv4B52oL6wQ8ByG7KlTY/oRHRudApXQaSZnNL4ZIcS+09t0
	TgMLU+y1X2Y8hrrwxvbhGhH+b2Uw4ZeSfBQeX31CH90dfvjGpimj4pxO7i+5wtg1i56kwIHTnfkPI
	wCfLE+oN7V46sX7obIz/hkpQMVhGWcbhCeDS3RnVhqqAmR61VB8j+quqRS12Q3e7kuOc7AVQprk2b
	kMi09sr/lRuu6THuavIKZ90MYFO/hGu2F40A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHIU2-00000000VOx-2yC2; Tue, 20 May 2025 10:37:58 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHIU2-00000003iJk-1xZd; Tue, 20 May 2025 10:37:58 +0200
Message-ID: <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>,
  James Le Cuirot <chewi@aura-online.co.uk>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k	 <linux-m68k@vger.kernel.org>,
 Libc-help <libc-help@sourceware.org>
Date: Tue, 20 May 2025 10:37:57 +0200
In-Reply-To: <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
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

On Tue, 2025-05-20 at 10:24 +0200, Geert Uytterhoeven wrote:
> Is this a Rust or LLVM issue?
> In case of the latter, how is llvm-mos coping?

It's an issue with a lot of packages as I have documented here:

https://wiki.debian.org/M68k/Alignment

While you could argue whether packages like OpenJDK or Go are fancy,
the problem is that they are build dependencies for a lot of other
packages, either directly or transitively.

For example, cmake has build dependencies on Qt which in turn requires
4 bytes alignment to build. In turn, several thousand packages have cmake
as their build dependency, so waiving for cmake is not really a constructiv=
e
suggestion to make.

And I really don't want to keep patching stuff forever manually and upload
it to Debian unreleased. It's a pure waste of time which is better spent
on fixing actual bugs.

I really don't understand why people that claim to be interested in the
m68k port constantly block any kind of changes that would actually improve
the port and prepare it for the future.

And I also don't understand why this is even an issue. If someone insists
on using 2 bytes alignment, just stick to your old chroot. If you're not
interested in new, "fancy" packages, just don't upgrade or install Debian
Etch or similar. Changing the default alignment does not affect existing
software.

The fact is that software is moving forward which also means it's adopting
new languages like Rust. New languages make certain assumptions about the
target such as the minimum alignment. And if we want to be able to build
updated packages for m68k, we have to switch the default alignment.

What do people that object the alignment change suggest as an alternative?
Tell the rest of the Linux community not to use Rust? Tell them not to use
Go?

I don't get it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
