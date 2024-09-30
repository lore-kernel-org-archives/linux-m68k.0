Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29E17BED6
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685544; cv=none; b=VPEfNX2rETEc/+U4Di2wZCSVTfhOsEuc6i3jVxeeE8yvdgveCSpynSJk8toQfGcLVbBW2cJzKKrqxDIGmajGCTQPxtf3qlY1rf31u9GF62tcxJyFq6kBS9WrTvfvDqYXeBWl3XNZ0lnfmK3mXEcHyqy6JHqoaFyfZLBCo5JaQJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685544; c=relaxed/simple;
	bh=4HRSZDAZYhHE8PQpfKR9Cvly+HiW2IAiQKYSFRni9Uc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R7vGiFHMbxC0f+95QryYMr9guVsQCRNEpVbWNlf/kfuAqZfswB3ptf6NlWK10gvS3d8qoozhqPwLbRCYFkTCh9g38ypy3KlHQCv95rTyWDxUjkL6PS0A9jJlOG12luDRddKqho5Aks7LHTjjiJBoyvsKt1gaTcJfWHLOWCg8PSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Z96ob3Tp; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Z96ob3Tp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aYFFd3dYJI6W/UtH6I2VA72/aOSAsoc7GHMVYnzvP2g=; t=1727685541; x=1728290341; 
	b=Z96ob3Tp5OL4FIrcMs1HcarTONwxnuMFmvuSx9YEVUt36jXbaJEFSjhN1UOpR73pwWqRLo1B9dz
	xB5eFsKGBP+i0BgjEP1IPEyjB+mkB3K+6UPwqOx4RuqOqtVCnHwglL5iHdJeAdt+1PepsmkxkrFCh
	wAg6qMMF52nzr9w5x3o/qb9qxEGNGbv+L7Y49rGIK9Fv6bK1ulRqAOimVzDw4+60TQQ5UQWCMplNP
	d3b3ReNmeTyO9aOPVFigPfVFR3DASKFHAlOs3lbLgHN+wMuDw7QpYLsHGqIh4dXr3vhqabh7pQbId
	O9LRRl3wx79xLhO1p7H+Uolh/fdKLmZ2E4Iw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1svBvh-00000002c3Q-3VBu; Mon, 30 Sep 2024 10:38:53 +0200
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1svBvh-00000001mdS-2cXT; Mon, 30 Sep 2024 10:38:53 +0200
Message-ID: <0bd77991e6223c4cec065ac6f7a348f9ea8e6c2a.camel@physik.fu-berlin.de>
Subject: Re: PREEMPT_RT support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org
Date: Mon, 30 Sep 2024 10:38:53 +0200
In-Reply-To: <a5f3b0f5-ed38-40be-b6bd-69e3b29ee399@yoseli.org>
References: <a5f3b0f5-ed38-40be-b6bd-69e3b29ee399@yoseli.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Jean-Michel,

On Mon, 2024-09-30 at 10:19 +0200, Jean-Michel Hautbois wrote:
> I wanted to try PREEMPT_RT. I added the support for it:
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index c7880f375518..b0360167574d 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -39,6 +39,7 @@ config M68K
>          select OLD_SIGSUSPEND3
>          select UACCESS_MEMCPY if !MMU
>          select ZONE_DMA
> +       select ARCH_SUPPORTS_RT
>=20
>   config CPU_BIG_ENDIAN
>          def_bool y
>=20
> And set PREEMPT_RT then it fails to boot:
> [    6.517000] BUG: scheduling while atomic: init/1/0x00010001
> (...)
> Any idea, thoughts :-) ?

From what I know an architecture has to be explicitly ported to support
a realtime kernel. Simply enabling the feature therefore won't work.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
