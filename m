Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576451CD15
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065356; cv=none; b=a9r+M0escX8zKP9VBLmenZ1NGC5CZ9g0OX0vMjNVN/xz3prCpzdNBY3miBzTXJ+835XZc9QQtHheOb+yCJD3YihTJNRBgAS3CC55Qz+OIUdPl4Czkcz37LvERovvt4duKVKQFfHBC6CBRNmkGL55RBbsQtlVkln6XZU59/3+9v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065356; c=relaxed/simple;
	bh=CbPrLOGqms/XAkOOI/wko6/flu6GCT7Z1Y/tS+9ttPc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Htt58G3YZ2BoPT5uODqQg+V9FCJtsCbEzpS4xKTKHpxQI5hg9GNN8/I02dtIWtnn3ZX+UG+VpRyHfQd5YIa9BdF+1P7wLQwKEGRSZ882zbccDpLPx0h/mgrob9ZyH1tVbifMFA9ZjqS+BMXGxyH2rREvDFAgYz59LSieunmgB80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=WzDkVb7H; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="WzDkVb7H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z8tPnOoVS9evgCW2JpP8If2ASJnIrTkM737YtHYqtTo=; t=1750065353; x=1750670153; 
	b=WzDkVb7HXD3jc9CW26gxfpVVCRVwJQ3mwFILZEKrbfDUT/9AMp/eTtPZ9ewHF65gXMRCNjBZJ9H
	9FBldIWfuucCOIQuLKue0fJDJXFa30vuWLamFA1Mpvt2X6ajVuP0w9j1bnV4WQ02wX/1pM8KDOTob
	lcMTGGp2KS9hcDme0QwaOWUBY0tvA1qDRMNhQCbYLcOJIIdcFkT9MWkDf1dMc7WDxYBYwFTov9ixO
	EC3CAL013effJXG95NRqF9OGage+8GFnTOMh1YQHgkRKHFI5bi9JtBi3lGilthXhQenBCN3+f7Isg
	ZqWqBmVIsay3faT5wGeN6O0Otxhk+s4hIDbQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR5wV-00000002mKK-2PSj; Mon, 16 Jun 2025 11:15:51 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR5wV-000000040es-1YHi; Mon, 16 Jun 2025 11:15:51 +0200
Message-ID: <f73add213b5c43b977967ff5c5cbd2c83c0ffb07.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 11:15:50 +0200
In-Reply-To: <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
	 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
	 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
	 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
	 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
	 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
	 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
	 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
	 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
	 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
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

On Mon, 2025-06-16 at 11:10 +0200, Laurent Vivier wrote:
>=20
> Le 16/06/2025 =C3=A0 11:00, John Paul Adrian Glaubitz a =C3=A9crit=C2=A0:
> > > And there will be a problem with binfmt_misc because we can't rely on
> > > the ELF signature to know which qemu-user to run, the one with 2byte
> > > alignment or the one with 4byte alignment?
> > What about the ELF note [1] that David Brownlee suggested? Can these be=
 used?
> >=20
> > Adrian
> >=20
> > > [1]https://www.netbsd.org/docs/kernel/elf-notes.html
>=20
> binfmt_misc doesn't use the sections to select the interpreter, but the=
=20
> 128 first bytes of the file.
>=20
> I think you need to change the ABI type in the ELF header:
> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format

How does binfmt_misc handle the various MIPS ABIs then?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
