Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D91B0F3E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063237; cv=none; b=fK63g0ZMi6sOXx1x3wFDP/NFvpRCmuSFl+lSy4dG9Biorn+2fHl1WASYIJ4YrSdeD3lQ4Y2SM2N260AwYTwnMMfVV3i6rJVmZzgweprVpnc06LW3GNQY4IR7dfoGnmPWdGUYNGNTuhjmghorQdRIOeq0q9xuDZR+0iqCpP4w8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063237; c=relaxed/simple;
	bh=FVcKh/9qh1KiHOH7DargT844skEw+djKAYF1WaIWDuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pedGO/NuUe+2/R0hRItkfENQ/5MP5qKUPm1a863GHYULkqkHTkfJFjyx58Fmm3FrIoS2ShSxX+BoYFuCar/Tur7o6iC+p37OyJ8BwgJOQM4QCepKAt1LhOTtlVL71e/z7IvnAGhTkP8DYT5CELX7NF0LYcUakFilHeMUta4Qrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=l/Kw1U+R; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="l/Kw1U+R"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44824E0009;
	Wed, 16 Oct 2024 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1729063233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjN4xfU0Io0XErXj8reTbUTsT0dTnAimbreoO7PQ/TY=;
	b=l/Kw1U+R0oqrzKj5LfpOUovsn+JGzu1CKDZGK9+HoHChS/Og2l4m7+n+ND6fmmOaCZftfU
	S8WTQVyKk73HUHWI6u7fvFHHLF6/pXemwa1FQz3A6YwhHaDOs3T9WqWZ7OpzVLTHKWunJ+
	2ykr5en90nnGySQXRln8dnRj9efrsVLnDJ5Ul7zF37QjynHyca4wTlNM3dz0JjKRdr8qgT
	hIC2fISgtHcTowY5rbXL08jSZISS689cZBLH7xnXdqqlXf15SOuRmdprSOzL12GCWqnKMx
	0EKY0GtUGyXOpOh82ZPAfzbY1L4GUXIxKjhEB2mwQF9yx1xCK+akCT7g8LiZwg==
Message-ID: <ccae9246-1980-4f9a-a4b8-5eaf78de8e5d@yoseli.org>
Date: Wed, 16 Oct 2024 09:20:32 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: mcfgpio: Fix incorrect register offset for
 CONFIG_M5441x
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20241016-fix-m5441x-gpio-v1-1-0a29befd4b8d@yoseli.org>
 <CAMuHMdVktMFfPQZqvB6cdMOmxwBuG7CW9rqm1kU+p9MnrF1SWA@mail.gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <CAMuHMdVktMFfPQZqvB6cdMOmxwBuG7CW9rqm1kU+p9MnrF1SWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Geert,

On 16/10/2024 08:56, Geert Uytterhoeven wrote:
> Hi Jean-Michel,
> 
> Thanks for your patch!
> 
> On Wed, Oct 16, 2024 at 8:45 AM Jean-Michel Hautbois
> <jeanmichel.hautbois@yoseli.org> wrote:
>> Fix a typo in the CONFIG_M5441x preprocessor condition, where the GPIO
>> register offset was incorrectly set to 8 instead of 0. This prevented
>> proper GPIO configuration for m5441x targets.
>>
>> Fixes: 83c6bdb827c9 ("m68knommu: Implement gpio support for m54xx.")
> 
> The typo was introduced in a different commit, so the correct tag would be
> Fixes: bea8bcb12da09bd3 ("m68knommu: Add support for the Coldfire m5441x.")

Oh gosh, sorry ! Do you want a v2 or would you amend it ?

Thanks for your fast review !

JM

> 
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

