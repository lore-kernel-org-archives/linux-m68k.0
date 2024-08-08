Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654913CFB8
	for <linux-m68k@vger.kernel.org>; Thu,  8 Aug 2024 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723097116; cv=none; b=l1g51Bod2DWWi/KVEXzS0tUXSVIMMSKIzRKx03DWs24P0qhVqmgOSEQJoECqsilRzHS2/2q/0quCepzImuvLlbUMX1SZB3XhKT+OcRR51IyvNsXGX3YHj72mcNkwtF89AJXcD3W+CjhJESA+66UnrsPPbfLfJVxGtQXuDpzy4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723097116; c=relaxed/simple;
	bh=RYHRqevZZLHVMRfZWnFV9RkzUE/53Qnc0cCeSBael8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY1/dj2vs5luagveFEQxXscDjEilNhWfJoS8C2UGCK17k4ieUPJZW+uA/1AeOwe6yXVHSstx0e2CuhNwVpkpBU8BV8plKTzIeus/P1ELKhiJy8DkboTvvlwaWHOdqoveEpNfkrNU2CApHBCU+aR3BGUdCHJooRa09sNM1NYvOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7981C4AF0E;
	Thu,  8 Aug 2024 06:05:14 +0000 (UTC)
Message-ID: <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
Date: Thu, 8 Aug 2024 16:05:12 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
 <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
 <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael, Finn,

On 8/8/24 11:57, Finn Thain wrote:
> 
> Hello Michael
> 
> On Thu, 8 Aug 2024, Michael Schmitz wrote:
> 
>>> Well, that __clear_user() bug is no longer theoretical. I accidentally
>>> bumped into it when I sent a ^C to a shell script I wrote to test some
>>> mac_scsi driver patches...
> 
> ...
> 
>>
>> I'm afraid I've lost track of where we're at with this patch series.
>> Does it need more work, or more bug reports such as the one below?
> 
> Apparently the series is waiting for some testing on a Coldfire system
> with MMU.

Ok, I am in a state that I can do that now (I managed to fix my M5475EVB board).
If I test the v4 versions of this patch set that should do the job?

Regards
Greg



>> The previous bug reports might be considered somewhat contrived but this
>> one's from 'real' user space code, and none too complex at that?
>>
> 
> Right. That code was as follows. There's nothing here aimed at
> arch/m68k/lib/uaccess.c in particular, just IO to a block device and a
> tmpfs filesystem.
> 
> 
> #!/bin/bash
> 
> set -e -u
> 
> filename=$1
> 
> rand=/tmp/rand_test_data
> zero=/tmp/zero_test_data
> len=512K
> 
> dd if=/dev/urandom of=$rand bs=$len count=1 2>/dev/null
> dd if=/dev/zero of=$zero bs=$len count=1 2>/dev/null
> 
> write() {
>          dd $args if=$orig of=$filename # oflag=direct
> }
> 
> compare() {
>          echo 3 > /proc/sys/vm/drop_caches
>          if ! cmp -n $len $orig $filename ; then
>                  diff -u <(hexdump -C < $orig) <(hexdump -C < $filename)
>          fi
> }
> 
> while true; do
>          for args in "bs=512k count=1" "bs=64k count=8" "bs=4k count=128" "bs=512 count=1k" ; do
>                  echo $args
>                  orig=$rand ; write ; compare
>                  orig=$zero ; write ; compare
>                  sync
>                  echo
>          done
> done
