Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F55592F5
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907064; cv=none; b=KrVifLDNUsZ1bVN6y+ZDlWyDphJZ8h57nyHRaJMqpHk4BB6WRIYe1ksAElnvn3ha8DJP2NqeYrNBb/tYANYwh7z/Svn/olUNhGPs9wxsHPm4FY7lUyYKzJUbu1jy35g9yYCWxpUuDmOXjOAAPrwZIygUO6z0dIn0ALC89psRbxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907064; c=relaxed/simple;
	bh=2n0phIkKhbmLdtV+ZLRMad8KXdidoIOnQMaJlIdjOps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us0pe+4Baq9faaTLIUIexlPpQm+MBXhevegu3pdCOQm80rC0PsVGyorruxKYhQ60jiNERR1LNGSy6C03G3fnM6ZOAu/mwEoW2OkC2Bsgsihv0GzmeBWgXdhkTkNwG4+HixJn0uWKQET0aY4bWQtyVq4d7Lg5zmZ+BmgY0nGxdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs4PuKBT; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs4PuKBT"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E17E41FE2;
	Tue,  8 Sep 2026 22:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3251F00A3A;
	Tue,  8 Sep 2026 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788907058;
	bh=7z89r6De+Pix2WcL9SoacX1sh2v4nb+4z6b1L4BolQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bs4PuKBTBJ0ljf4gzJ5wMylFxMyLimDh67zyNz3W6NKDINFJGk2EEJiMNNUoE3kq/
	 sX1IxqZuJBY6pDry3k52BHgs2TvjAGaKHqK2nYcWk63N5e1vsrr3Rty3BknUxOBdaa
	 QguXJ0bvLEB0RrKHBtlKK+PtuZqMPvBzthNqAbftO80Cj/RwjtHVT7pC1mKsATfLHd
	 84k0KtpeyiQyYjbddm6jVpgTtgROswYsnDzdpUeLryUqLWCPrtamZIDO15YcLpHMtT
	 84OQkyZKZh3NiZF0nlNngijZGKh+fnqVb7Yh0feaACmaBAH+u5oV5L3o7iGIkv3Mhk
	 ojYe7zXFeZZ0g==
Date: Wed, 9 Sep 2026 00:37:34 +0200
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
Message-ID: <aqCOLjfOHCpV-9_E@kernel.org>
References: <20260731094402.741645-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731094402.741645-3-thorsten.blum@linux.dev>

On Fri, Jul 31, 2026 at 11:44:00AM +0200, Thorsten Blum wrote:
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/m68k/include/asm/serial.h | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Gentle ping?

Thanks,
Thorsten
