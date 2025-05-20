Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7546647
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733981; cv=none; b=K9umwJaJ4TrhgvFqf2Teibo/shBrUezS7QRK5Eila+ZpMkkvksHd7NzNhg/DLBe+wS0Y5LJWeAQX65Tb+CB5KTHIzjtU2pLml7gHxTuI6+T4PWohMGXF1EjXFhdlCd6/0O6bAYGcS5GHv/gf+QWc9Vt09YPmgUc9AK5zwQojJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733981; c=relaxed/simple;
	bh=aziaYdz2VYuc05W3NuQQY0tBBd+hwqSpORAuyI9vGkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFlGv3kdqwBdeylMxQ/HSUCZuLbpIwyab0ZOS57bgHYC7tKS+aTgHks8okC2jCqSkR1YwWd/pLlszQ7WsGl+YJ+jMc4LCxSfwQ2AWg/HSKp6Tc+Tk90fFXo22aH76+PoI/0Y8Gb/8xoatfKGyrzC7+0+0fsIvsFHeLdbZVuZINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=NyBGF/I7; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="NyBGF/I7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UudVE5TQvbrxOwUjocfzBGm0VJAlILmXB1fGjTUdbg8=; t=1747733978; x=1748338778; 
	b=NyBGF/I7L00PvEaY4vt1Ml23EhtO0GJl7LZFzB+3dGqdo0vELCnGQlfgqueTCDIS4Ofn96PGleM
	sFKqE6no3KJXvxHY24UMuqJw2rE5Ytxyd2dILHQZ6Z9KjuPQr32f+vTpQ13gv2A90Af6HDHXWK++h
	NB4sRAwL84sDYECivKaf1w59pXz041J6XRX7Hcq8DFBqe7K5HLHNpbEQA9ZGfmxmIifdfaomZqPhG
	TR7H8+bX1ZA+T7JG9G+EgK125BPk5O3WCY1kuJXrBbLi37U3jOWwZbbE/MwRJ6YoMXlldGNPmeDyz
	35T1r0KlcAyjiQv47pzRFEciStVFJ3KEI7OQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHJRg-000000015W1-1FNz; Tue, 20 May 2025 11:39:36 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHJRg-00000003wyp-0JdJ; Tue, 20 May 2025 11:39:36 +0200
Message-ID: <ee846efaa0f328738bfc4ac48c9f4204e2cab89e.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: James Le Cuirot <chewi@aura-online.co.uk>, Florian Weimer
	 <fweimer@redhat.com>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Date: Tue, 20 May 2025 11:39:35 +0200
In-Reply-To: <ef0d6607b9767fb755456fe4cdd0a262657493c0.camel@aura-online.co.uk>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
				<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
			 <8734d1kofn.fsf@oldenburg.str.redhat.com>
		 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <ef0d6607b9767fb755456fe4cdd0a262657493c0.camel@aura-online.co.uk>
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

On Mon, 2025-05-19 at 22:51 +0100, James Le Cuirot wrote:
> For what it's worth, while Adrian and I are largely aligned (haha) on thi=
s
> change, myself and others in Gentoo do intend to use a new tuple. The cur=
rent
> plan is to do this at the same time as time64, which we believe also requ=
ires
> new tuples, despite Debian sticking the same ones there as well. We are a=
ware
> that other projects will require adjusting, but we'll just deal with it.

But what's the point for doing this? Are you worried that the three users o=
f the
port are going to have to reinstall their systems? Does this really justify=
 carrying
patches for many other packages?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
