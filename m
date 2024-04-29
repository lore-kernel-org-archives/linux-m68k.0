Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC714AB7
	for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714377516; cv=none; b=pSV9g4BS0bOLZ98lt7csSMqxxOOfp6bJmrKly+GDAZrpsHc9+2gppjbdDTsIfLx+YJVnzoxzDnJ1iaZa7JCILP5F6E3RBizrmSgtHR8zObSd4C8gvuu/vI1eoGfyMUNmnSDr3kqPcuXxnASPC+jdQbzJJv/z8rBfM+UG/3S625w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714377516; c=relaxed/simple;
	bh=wPEYtjPPQiQWRcgMB/RjD5EExCUE3Sicf8+RIbBmUDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iJqq5oKzQV8qj1nPLAKZCMg2DOT5/AfVLhEqyCUwlui1/iYFwpotQIp7v6Eji1FCkETrqQWIGvQte8jz+GJYrfRyGPZu9dF6ClJjsPLQTDgMKN+GyFRudWFqP0DgzoHXR8CUm7edehM1EGcax/gIgm9h8z3V2fdyRgStOogYPmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B83C113CD;
	Mon, 29 Apr 2024 07:58:35 +0000 (UTC)
Message-ID: <5d72bdb5-a98e-4b2a-99d0-73b592fe0993@linux-m68k.org>
Date: Mon, 29 Apr 2024 17:58:32 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] m68k uaccess fault handling fixes
To: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org
References: <20240429030945.22451-1-schmitzmic@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20240429030945.22451-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 29/4/24 13:09, Michael Schmitz wrote:
> (Actually now) version 4 of fixes for uaccess fault handling
> on 68030, tested on 68030 and 68040.
> 
> Patch 1 has one exception table entry fixed (residual
> calculated in __generic_copy_to_user did not take into
> account the number of longword transfers omitted due to a
> fault) si as well as a final NOP added in __clear_user.
> 
> Patch 2 is unchanged from v3 (actually since RFC v1), now
> has Tested-by tag by Finn Thain added.
> 
> These patches would still benefit from testing on 68060
> and Coldfire.

I would very much like to test them on ColdFire. Unfortunately my only
ColdFire with MMU board (a M547xEVB) failed a couple of months back.
I am trying to find a replacement, but so far have not been able to get
my hands on one.

Maybe someone else out there has one they can test with?

Regards
Greg


