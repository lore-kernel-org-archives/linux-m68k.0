Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EBD2C0F8C
	for <linux-m68k@vger.kernel.org>; Tue, 17 Feb 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771318206; cv=none; b=XmTOgyXYlJoU7tP8UtLshFJdNEdWPoKG3gMUOoSH4O4iXIGCRoeQeRUw5rX6GcDghQHSSL1vhNdceTveAbY9X5W2NTGa/ja4dQdV6t23M6QKtw17vwimgf2OXqKCo8VYFF15Kr/G+MDN33eiQMAYDPUocXLaTUxUedDobv+IyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771318206; c=relaxed/simple;
	bh=NUsWrabU0pFOFVRM0by/+PTJsrUXGQrqTH9od10cZHg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=MZ1zDKEJoB5FwsszCNpHwRyB645UaO/HDLveVPZawk57atCp421AXmu+QYIl+DvwHjNRxBa8918dqRseQEIZDMVywaqt0TumAzgZRRYEff01MGuKujKZvWdZiKne8LW5ELs1K/rdVw8JXRDlQDKA+2XU3rzsPkNASyBikpOl3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Tvkok2Mi; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Tvkok2Mi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:From:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ACo0Jz1FdWZYJ0L7VVYmImBxC9v/HDg4tO3NttWbIl8=; t=1771318202; x=1771923002; 
	b=Tvkok2MigrXZA6fl1VrWvgvk0ds1G+TILzDgTQFHV1i3ZYDjRIrYtNKYIUVN3VmRtC9USvxGKcs
	EJndnVhfQ63rjROxwr3Z6kCNtpGfWQ/1Eq7PAnj/6DgQspPvB1dkYZjwr9N4mGw//hihoUYY9JnYo
	OkVRfP4Bh+JCwhh7rqIQSg28kGvzzsN1DHZIEXPogsQp1MMA2nRKcnoJyPZj9TtJgaat7J7uAgde2
	mALlkXsMfiVjcjoaBq2g7V0WiL1+kiA5FvLSc1IfhiAoPxia8//8hwr1ZFsI61oyNXKovU8RRcCwL
	IlfFM0hTFdz++n85C39zqYrmBSe2GHPvMnLA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vsGmJ-00000000WvJ-0p7S; Tue, 17 Feb 2026 09:49:55 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vsGmI-00000002Ry8-48ei; Tue, 17 Feb 2026 09:49:55 +0100
Message-ID: <dea6a68a9a0e56af0d9067aac6b1d2e91aa372be.camel@physik.fu-berlin.de>
Subject: Upstream issue tracker for m68k created
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: port-m68k <port-m68k@netbsd.org>, linux-m68k <linux-m68k@vger.kernel.org>
Date: Tue, 17 Feb 2026 09:49:54 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

I created an upstream issue tracker for m68k:

https://github.com/M680x0/issues/issues

Please file any m68k-releated issues there that you know of.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
