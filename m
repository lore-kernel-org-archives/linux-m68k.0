Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413229B23E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Apr 2025 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893091; cv=none; b=iYhynPyxXYB6wR2Dt4VIsm2UrIILfP//uYu6VEwES4XF3vC1DjmYR9EFbTOUE8wGFM8pPHoNoMmF7tSYjT39hKiHDRKr/5Rg+PKRiqoKFXitAoVz+nWjghVupDjqxfoODYz18wPybF8gh0be731sqLsLgiRMDJrzx2HoaZkSrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893091; c=relaxed/simple;
	bh=WqI3BDt2ktsqzmLmXUsvdTN+ybpt4JxjyySqnvpfTDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sp6FMkHvmrFoPOrFR1K0dZTGZLnBNGN0+OYtUN5aK/qNee93elx3peWl5WJZEqnRIF1GKvwAfS3zAFDxad/kkwql1Bqhwu58ic6kSK+tdaWKEAnoOMmAoZz2SN1rHZyDyDFFim/bE/DJbOavs/Fm180quDiIPb2lmDLspOsz58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 708D3615EF;
	Tue, 29 Apr 2025 02:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ED3C4CEE4;
	Tue, 29 Apr 2025 02:18:06 +0000 (UTC)
Message-ID: <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org>
Date: Tue, 29 Apr 2025 12:18:04 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250416114240.2929832-1-daniel@0x0f.com>
 <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
 <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 29/4/25 10:04, Daniel Palmer wrote:
> Hi Greg,
> 
> On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> I notice that some other architectures (arm and powerpc) have version
>> checks on gcc or ld in the config. Do you know if there is any version
>> limitations for m68k here?
> 
> I'm not sure about that. I'll try to work out why they have the checks
> and see if that affects m68k too.
> I'm using GCC13 so probably new enough that most things work.

FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0
and binutils 2.32. This patch worked fine on that.

Regards
Greg


