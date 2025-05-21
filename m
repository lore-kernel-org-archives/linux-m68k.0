Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E223C4F4
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819177; cv=none; b=E7UYA1Rrsz6oO+0cyYcL1389ydZAYfmzIqkw6eoF4VRPG0gqqpVuMqedDFcAazbael/ZtzfpL4afBfx2zk99vHpCLby3uoBvgFVMuxzXW6eQcKEGNtG12vojzYMtIrutelP2FdTjRy0hdrnGpAOJkqsGa0DINUHsK4PQIk4Bpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819177; c=relaxed/simple;
	bh=duhrUjk+FF4yUZhJmLb6+mNpaaqFZqHEvpvU9rkbHeA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DjIK6BRt0Y7ILAeegdPFOm5qyVBONqSfhQxBBlNRbEwLw/ozzK7PoheHL44imrdUnvNt6HdLen1i4NXqEgHhZzJKXH+EpmsKsYY7S9uoUZQkGWjVFl19y0h05gAP02x6hJjxdNv6BUvC6/u3oJvsGVwcSMNPb/uxEY8may3XXz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=mIh/LpRp; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="mIh/LpRp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IRNyzj0CctVaKA5WIQFow5RVV5rc7XlxPA9ELriSj2s=; t=1747819174; x=1748423974; 
	b=mIh/LpRpgw7S89kIfzRELGjnEaK97FMNeV5BS8OzYAPTH1H4uRZHqty5w+FJMtq10meTiVDRaIq
	8gPOlSvJwGOLDAyBZcTz9FALWaJ3cbaXBsH1rRgsVX7nm21lFeo3d+4C9PwpZF6a2z9izq4BAlQAN
	Qh1RAQW7JqES+hzD8JoThi+/UcaeZx/OV5jMMQ1IQZeo033V+7FEXJzEM/2f0L17GAYj65fgE70fV
	LiP5McgpbSd0jxRkyegYB8La6V0gX7A8wP6x/cUF76IttLKgmN04lLY7usmkLBwqCRSFelC2VDlqU
	KuVVYs9QKln3XvVlOjRHK2xUtuC51AG1Lz+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHfbi-00000003hCt-2c1T; Wed, 21 May 2025 11:19:26 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHfbi-00000003GM7-1ivV; Wed, 21 May 2025 11:19:26 +0200
Message-ID: <169ab66f97ceacc53f4e003ad528a4d42a859b7f.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: James Le Cuirot <chewi@aura-online.co.uk>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>, Florian
 Weimer <fweimer@redhat.com>
Date: Wed, 21 May 2025 11:19:25 +0200
In-Reply-To: <15f4dc658d4f3358ec2c10796c2fe34328eed18a.camel@aura-online.co.uk>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
						<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
					 <8734d1kofn.fsf@oldenburg.str.redhat.com>
				 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
			 <ef0d6607b9767fb755456fe4cdd0a262657493c0.camel@aura-online.co.uk>
		 <ee846efaa0f328738bfc4ac48c9f4204e2cab89e.camel@physik.fu-berlin.de>
	 <15f4dc658d4f3358ec2c10796c2fe34328eed18a.camel@aura-online.co.uk>
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

On Wed, 2025-05-21 at 10:15 +0100, James Le Cuirot wrote:
> > But what's the point for doing this? Are you worried that the three use=
rs of the
> > port are going to have to reinstall their systems? Does this really jus=
tify carrying
> > patches for many other packages?
>=20
> Obviously, time64 affects a lot more than just m68k, and if we're doing i=
t for
> that, then we might as well do it for -malign-int at the same time. I was=
n't
> really involved in the decision, but I think it's because Gentoo is a rol=
ling
> source-based distro, so ideally we need a way for users to migrate their
> existing systems.

Okay, valid point. I wasn't thinking about time64_t at this point but just =
-malign-int.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
