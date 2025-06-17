Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313A1C54AF
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155217; cv=none; b=GRAzw3ZCt981gozsO3GGg0dQyMneARAUWXT4kiEZxwDW+y0uu57ayk1QhI1148WHIz0Xa0ur75x8uRUTlpA6sGMkbV6bI4vNFkDrOWVq1rCejWopBCkHa7q06t4OZgDg7pZM7Ul7oH5cdqL5AmAAM5rr4yBh6P1P6Q5AsjknP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155217; c=relaxed/simple;
	bh=N0noP2ek25mE+Kh937k2PFUvvp+qW77MC07IwWj3ufw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pFwBtXgN89Ge/pQkUgwDxuxxCFHqN3f6A7RT+Oo4Wmr1UA3s6GgV1MueJpigHv+ez0g7yPNASmpR7WIenfijCgCf2cOkwexPMGtqZDMwM3TgQlEUmvFAvWRGRk6usdwFvvTKFnNLcJRGtJ7nfFKHPe7LXnFfCDZOf2SCgvP0t+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Fa5yH6HU; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Fa5yH6HU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sV1Vx1T/XW7YC2z6L3XAvfIsFx/G6LZ3XezCcQlV1hc=; t=1750155214; x=1750760014; 
	b=Fa5yH6HUx7WdBrjCrQd2B1sR+wlBajOByIXkciLuRVfnFLHg1P4fUXhzhI0NGmBm5Fb8bD8Yg2w
	mptx8s8A1vt4g7DHvYghyXmnncWSAO6dMiBHMmqG0Ad3sk3wGAHV1PRQ60/1m/kQpZGq3lULUd5T5
	qmLJu9STnsmYiF1LJMD1LEpGaobLg4ClOCW6nCn5tWkITlxOBwqh/0m+ZOunf5xdSsJtScv9y1xVM
	XjiS0U+arXWwCA+65l6iVtoQBFGb/THTpGBAqtZYGpC3NsCnFJQC/ysYccoWqod82/cOvzUIqvL2i
	J5Sh8x4miraKvIN7WpjvI5zRG0PsqZpPMzVA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRTJt-0000000364A-128L; Tue, 17 Jun 2025 12:13:33 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRTJs-000000007lD-3WsG; Tue, 17 Jun 2025 12:13:33 +0200
Message-ID: <730b54f202dac75ec23d59e7c90bb1b13bd30a58.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, linux-m68k
	 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Date: Tue, 17 Jun 2025 12:13:30 +0200
In-Reply-To: <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
	 <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
	 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
	 <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
	 <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
	 <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
	 <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Tue, 2025-06-17 at 11:59 +0200, Geert Uytterhoeven wrote:
> > What's keeping us from creating an ABI v2 using either e_ident or e_fla=
gs from the ELF
> > header so that we can fix also all the other packages that don't work l=
ike Javascript?
> >=20
> > If MIPS can have a plethora of updated ABIs and even POWER got an ELF A=
BI v2, why should
> > that not be possible on m68k?
>=20
> IBM annual gross profit for 2024 was $35.552B.

I'm not sure how this is relevant at all. What is the gross profit of the N=
etBSD organization?

> > > Is this a Rust issue, or an LLVM issue?
> >=20
> > https://github.com/M680x0/M680x0-mono-repo/issues/10
>=20
> So you mean it's an LLVM issue.

It's an issue on many projects that use things like tagged pointers etc.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
