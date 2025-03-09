Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A931A4AAA
	for <linux-m68k@vger.kernel.org>; Sun,  9 Mar 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741516907; cv=none; b=JEshZbA5Y+Va81dpqmJRoefi/e+6n/WrHHQ0r/8fI1P4MfDqSq+NnrdpPdOhJM9odBO9ZNmNy/oQGM2YZwfGkIG896S54scMvqHSnSjo02BD1xiTsSH3H64jhdAca0wMgkHf7PuGhI9IYtATyRQkfJRwW9Rc2y/ZxDnas/8E3bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741516907; c=relaxed/simple;
	bh=sjaskFmkRQZQTje1YaO0tVylNtsIG9BH3nmt2EaJbTY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=jZWVJC5dPl2Hk7VWAWIfjgU+O71BsEWxTwHMb1q/EhHC0dbc5kkQRX+O9O9xNxwVuxqEoAAsCvLJCytpUpfdZpmpY7X6X+vo372CCRjPISE33BMX4r0Qp+ShRyN5eEeCCgHTIEwl31ZJlASdoLVAUat6eL1I2e+/+5uI4NMQ9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=iz9tO11e; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="iz9tO11e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qclDCM0pw4RoQWhaRibGvXUcY1HdmyCm4lQI+y/0cT0=; t=1741516904; x=1742121704; 
	b=iz9tO11e1WdoHIz4CWIkrV9f5j/sMB4USDYWrgF4IeiXrtIwl9xyUIX8QR911zQe+p4aeg/5cpZ
	YV7VvO0asBy3B2C04oLzeUDRB65dBy7Kw2FC8+u6mKYtnRhbMeOpu9quHwJhp3sJpW4iPV2LCSKXd
	AgrWirb1ss822AqumszIAa1NI3lewhLR97RISKKb52molg9UfAcDt8/XEmm6/GJBjjAY+If1MNeHv
	X5EmgSAZ92Hdqv6YqtOTpwbYL44WepeezeX4ije6T/vrspzGYe90SqWRMHtiAkx0+Z8GIVs+oSSQ5
	Nl9BhJjDFfv4tkMDeRv2+AsOw9Pp1ehXzw0Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1trE2w-00000003LR6-2hiV; Sun, 09 Mar 2025 11:38:14 +0100
Received: from dynamic-078-054-178-139.78.54.pool.telefonica.de ([78.54.178.139] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1trE2w-00000003Ccu-1sHh; Sun, 09 Mar 2025 11:38:14 +0100
Message-ID: <10be3c697f6702a63a20219160e671b1920b3d6c.camel@physik.fu-berlin.de>
Subject: Alignment discussion wiki page
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>
Date: Sun, 09 Mar 2025 11:38:13 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello,

I have started a page on the Debian wiki for discussing the alignment issue=
:

=3D> https://wiki.debian.org/M68k/Alignment

I will add more information over the coming days.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
