Received: from welho-filter3.welho.com (welho-filter3b.welho.com [83.102.41.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4243032A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727081135; cv=none; b=MZNrT428MNLVgGCli9GsDh4OD8ZRa8h9t+/ykNzpNQ6B5Q55g2h4VdTPWB5rmGNdlFirWagvwwYvhyOwhZbdiVF6y1DtqmxUXyhtuRqMrNUSiIoobI8sAVGkepTWedwnd/osZWoyfjcAsW9w9ZNoRF1fWixxaN28f4IOaMUBu0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727081135; c=relaxed/simple;
	bh=BIi5lDLioki0tXmu5Sdw75hzelS8jHZATepEW1R5rmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uR0V//WM5I66NARVqTBcBuAs5TdVKo/0UmLvgYI9tgZrh+3MqNtyp6bzgHKvyvwzLYZgETg7572iJHsi4p8MJlt1Pn27R4Bf4q50CkanaRk8W7GNk1N5kBlaUtPAbGVGf/34Wq3cAf918EyizSVXSyZzBTUHkCahTn9+rBdL8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter3.welho.com (Postfix) with ESMTP id 2D22C131A7
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 11:39:14 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
	by localhost (welho-filter3.welho.com [::ffff:83.102.41.25]) (amavisd-new, port 10024)
	with ESMTP id H54mLC8QULXf for <linux-m68k@lists.linux-m68k.org>;
	Mon, 23 Sep 2024 11:39:14 +0300 (EEST)
Received: from [192.168.101.100] (87-92-120-123.bb.dnainternet.fi [87.92.120.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by welho-smtp1.welho.com (Postfix) with ESMTPSA id 07318521
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 11:39:12 +0300 (EEST)
Message-ID: <e3d58da9-e0f6-43b4-b907-e056581ef482@helsinkinet.fi>
Date: Mon, 23 Sep 2024 11:39:12 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
 <5dfbab6334853cc2efd6cc223c198d698bdb5fd3.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <5dfbab6334853cc2efd6cc223c198d698bdb5fd3.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23.9.2024 0.58, John Paul Adrian Glaubitz wrote:
> On Mon, 2024-09-23 at 00:48 +0300, Eero Tamminen wrote:
>> Not having it configured, but crash backtraces going through its IRQ
>> handling code, is confusing (found while debugging issues in Atari
>> emulation).
> 
> Please rephrase the patch title. The word "drop" has a very specific
> meaning in this context, namely removing a feature. I would rather
> call it "disable".

Maybe "Call Atari EtherNAT functions only when it's configured in"?


> Also, I think the longer description is slightly hard to parse due to
> too much brevity.

Would this be easier to parse?

"Found while debugging emulation problems.  EtherNAT functions were 
visible in some backtraces, although EtherNAT config option was 
disabled, and emulator did not support EtherNAT."

(This is from many years ago, these patches have been part of Hatari 
emulator, I just haven't posted them here before.)


	- Eero
