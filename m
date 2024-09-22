Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9941C6D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Sep 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727042535; cv=none; b=W/BFSzdrCZ59OoSV9jvsLu5pf/jrL0x+y+hsEwzufcitDyN5CMy8vOpIy65JzS8gr2QtPmWGkHPPJJZRnAvVdQg/hKbSTkcuZjjJN/dyEulF+egCDvUij5zFNuvoGJRAFRm0x7brBdwEHP6uVhkPT/MyJ79DLcAJopPcytkmcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727042535; c=relaxed/simple;
	bh=AleOS2+znN1zLMdS9shtVf4nb2BrM28xFlIgfwGgk4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cbLExk8lJsGEDfvsaSMU2hwJ+8kJfptzvVpmr90z9ddl31uD2EW946EMUw4v7SrjR4CjcNDejh23vTlg9p2T+h8aCZwiRRbjBliSG+MbxZMyalmCg290VtU4rO6wQ0rfew8DGIHiYGTfU6biD9pClZ8KiZ6ZEZTN9PK1Fdl1wEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=nbg3hwjE; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="nbg3hwjE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qSyOis/pQpP3JamUFW+bZLiHE8WzsSquqxd7br3ylMg=; t=1727042530; x=1727647330; 
	b=nbg3hwjEBO0nK185S6l+/NaYg3IBVOoIVfs5mcD0MOe2LPNxRoz7Rim8Ho5dcXHUs9oaaxfwNb9
	4AL8xG1fmQS4zJaEukEImoEuvX8iDLYXEI2NAbte+OmaY5NZo0Wc0kFPEkd3FSXwLRIXE8K0N7pND
	ogvDfqvpMijK88tVuBqPmMSizUEFSEKhnpHWwKhMXd2IrreoKmRgyP0NwolApTB41zfCP7431/vsE
	/MAo6ZNM2JwHDErxcR1YzS6pmgQGtCSZ86kneft2bEu8vS528/SfF3I4fiyB7iIB3RbgDTJh8WnSB
	aErW90bMOpLn+Zipl+GPNIXMuWgryCzSslyQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1ssUbS-0000000252V-2Pxv; Sun, 22 Sep 2024 23:58:50 +0200
Received: from p5dc55b97.dip0.t-ipconnect.de ([93.197.91.151] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1ssUbS-00000001gT8-1YMg; Sun, 22 Sep 2024 23:58:50 +0200
Message-ID: <5dfbab6334853cc2efd6cc223c198d698bdb5fd3.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, linux-m68k
	 <linux-m68k@lists.linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Date: Sun, 22 Sep 2024 23:58:49 +0200
In-Reply-To: <20240922214821.16818-1-oak@helsinkinet.fi>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
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

On Mon, 2024-09-23 at 00:48 +0300, Eero Tamminen wrote:
> Not having it configured, but crash backtraces going through its IRQ
> handling code, is confusing (found while debugging issues in Atari
> emulation).

Please rephrase the patch title. The word "drop" has a very specific
meaning in this context, namely removing a feature. I would rather
call it "disable".

Also, I think the longer description is slightly hard to parse due to
too much brevity.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
