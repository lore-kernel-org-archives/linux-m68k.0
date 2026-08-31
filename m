Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137331AF07
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 02:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144358; cv=none; b=D8JYa/2dVN+HmFpGDC7Z7zXeWVBXu26NatwESUNbCDrK1NRCQeHPcsetAKLLMGFWQP8Qw296D2I7EMo/D0QtHX8Z15CtbOvaX1OT10pMm9Ljk7BlrIJdDvc1BfwD9bFJ3sv6f4s0EHP7F6FGKah19aizdEzha669nmtCK/77r0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144358; c=relaxed/simple;
	bh=zXYWTLCTHI/6KQTOgmXvP7Qp6DMwJvkByfsxHnUhcXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3d8Y3ggfwzwZLzLl3bLQ4DYOEENCejOWrcxMWYuyzFbyDK4lOQBLOh0Nw9H5lVcntqFSjTkHJV2vmSCwaC5UeTGzaaaxTxrRV5MWyGPbgYoaDM/qwb5SHEeSmPgyV+frEMOCArp7doSRbLe7Nhycph5qpbCXY6UoJrX+uog+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpRGEFE9; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpRGEFE9"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64C5E601DB;
	Mon, 31 Aug 2026 02:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3741F00A3D;
	Mon, 31 Aug 2026 02:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788144349;
	bh=Db76gXTn0RyKBWOYo9vjRbnFdS9h/GmoA1KdtvW1NO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CpRGEFE9dGIZNcW0gMY9jJxt7fkciU2hR0ja+AVAUxk6e75Q6XM76yLINcmoZ75m5
	 NHEr1PqwkppB01GIYDzLFbJBnsGBG2+NIvesmaM8e1wW+8uPPplVR1QOqYRzKVYgbD
	 11NhECmT6RyLVOH9zNBEy/sANGJ1UiqQdpbKDtuC6FX+nNbwRynItkPeLf4m6Bh5o9
	 SUQptJ9wUdSxfWVsYckxLZUJlFlz3WcLtfeGCrHJH3LGwBJOZETcsAwEpxdzFhIOgf
	 LsHcQU0veG6DG3ksernOG86XPRJqaHOHq6VfnIhzYzUBx90yYhUDGnEZxcCkua86rX
	 1qLY9KhgM2l9g==
Message-ID: <b959b6d9-2fd1-4eeb-bc45-4968321b3ff1@kernel.org>
Date: Mon, 31 Aug 2026 11:45:47 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] m68k: defconfig: enable PATA_CSWARP
To: Paolo Pisati <p.pisati@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20260826160911.460165-1-p.pisati@gmail.com>
 <20260826160911.460165-3-p.pisati@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260826160911.460165-3-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 01:09, Paolo Pisati wrote:
> Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Assisted-by: Claude_Code:claude-opus-5
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
