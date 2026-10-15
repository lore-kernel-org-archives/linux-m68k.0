Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6C51599A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058348; cv=none; b=k355T8XlkNb4hCcsSdW4ZW8exIH05BGx1FqXUrI2PxGevaoX6U9pv6CfufNMHPN2TWThlDMsFofvpznINWllHDH7lVFd3Krl8C+exuy1HMeUqF57MGf1wCAyfdqSc70LV3Gp+Gg85x68+v3BWa1Glz0vwXEtbRbcvYArk5RBPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058348; c=relaxed/simple;
	bh=Y4pBy2x0j6Suc5T0MdHA3GtQWW2AivDvn7u3767tiXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkAMS1QKVccl6BY8Wg0DU6K0LC66F13L3PmfocXg1kXYg1T2wl3hTUNMJjckb6A6dckJmx8AFQJtCdYxSsVImtZpXdwnS8JV8W1MWo+aHApQf6BCA9ljvDUu3UzrYmF7MasoxK517zQRvoy6HSQe8nu6IAt1n2RO9xoZld7Bs/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAABnL+Y; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAABnL+Y"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D70B360120;
	Thu, 15 Oct 2026 09:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E490B1F000C4;
	Thu, 15 Oct 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058345;
	bh=2w8nKiVNXKMTex69kXfqDRomq+Zwxb/enPBvj8nlfgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MAABnL+YNUJ/43f1DfMwxhSMnzYFkcsn8s4nRUndb+5Yk8wa7q5CdTgrL80IMoG43
	 wxa8IFmRn55OVqzhKceP7k9S3jKEGxJtpe0lct/zJQ210l4onti89YBNDmiU7+xoVm
	 mTogZglMzEk6EmnG6/RDMTKgOBRbQUbf3zKAfMpdxqMsX6grS14oxtNM8dkrdM2236
	 ACJ9VjWVTQNLyOj5FzHohAJcGEDL4JFMup2Vyvd2uRUoXuMFdphov5sguRVta5+gF2
	 G8exkrvxQp09n8vSVgMVwnGZA307T/ko868/xfG+T9Z8pBAQBBkQTmZhelUbmyFkre
	 S8UscuthDTANQ==
Date: Thu, 15 Oct 2026 11:58:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
Message-ID: <20261015-valiant-puffin-of-zoology-6ee470@quoll>
References: <20261013120831.1046590-1-gerg@linux-m68k.org>
 <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll>
 <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
 <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>

On Thu, Oct 15, 2026 at 11:19:31AM +0200, Geert Uytterhoeven wrote:
> I guess you want:
> 
>     items:
>       - enum:
>           - fsl,mcf5206
>           - fsl,mcf5208
>           - fsl,mcf5307
>             [...]
>       - const: fsl,mcf-uart
> 
> As no new (possibly incompatible) Coldfire parts will appear, a generic
> fallback looks reasonable to me.

Yes, although still preference is to use one device as a fallback.

> 
> An "mcf" vs. "motorola" vendor prefix might still be a discussion point ;-)

Best regards,
Krzysztof

