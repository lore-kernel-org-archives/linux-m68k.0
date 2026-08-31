Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE823AE19B
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144349; cv=none; b=LtA07XRO2+EUSvPARuKMZ/Wb0WdDcwCgvQS5OPKH7nfBDYMOYConp+j/YEWkeurHn00rA6F7dd+aetaJU8eg7dwWTWF8X8NaSpTupKrw4ZuzPy0Okb2rXVyycZV7HgkfnnvrAK3TgeAo07KGFRCaU28Og25a11kihjobGSXmzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144349; c=relaxed/simple;
	bh=7zZeTt2eDzvlQsHjRw7GEeN47tXKMet8vNLBOd2KMoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCYykjHDA1MUi6G1XMrlUF+ylezuS6uB91g3dG7DthFSM2N1cBntNAScd42lD/K6KqfNUqrDRYiJ3fOYVpoHphtdZe3yNC3p7D16VwZmFVfD6/F03Ma3/MFP27YXKIjplcNkDhT4Xe6gArhb6t+Z1x8KR+kWxRqY84vJ5JXnEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFMfGgav; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFMfGgav"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8206013A;
	Mon, 31 Aug 2026 02:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBD01F000E9;
	Mon, 31 Aug 2026 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788144344;
	bh=1w0s5jSSQtVjtHpRtzem0HjXULLO6/kYnUZWtU9nwtc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JFMfGgav43BxHjrZINv0XZQndfXqoapjEWevfcTnSsr+aaAr1EUg8vQZQ5bHl6awr
	 EFkgQYCB4qzokk0ccpQyMwC58bmBi9//4HvwB/zaqdb/VZI4GTnU81jJNamkdTH5Zj
	 H8dwd8Kwp5Ab31EKVWVtHMXEiZ0SuJONPIcDsErfsSy0z1B5SSYm8MmYBtpg6UK7P0
	 Y7Oai/WMC3FofX4fNoVuvNwCnj3OimzqwBJBF2/Rg3QwCRP+DhQDguqZjyc12VEfBs
	 zd6lyIjnPatrqTRtRztQfHilpfrdzDV9DCRF+OesDFqCx1cEkjF2kwPd7A45WQLAH8
	 0fLDFLjHqlzgQ==
Message-ID: <38fbb154-b195-4fbb-9961-afa926ae2816@kernel.org>
Date: Mon, 31 Aug 2026 11:45:32 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20260826160911.460165-1-p.pisati@gmail.com>
 <20260826160911.460165-2-p.pisati@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260826160911.460165-2-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 01:09, Paolo Pisati wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
> 
> Assisted-by: Claude_Code:claude-opus-5
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
