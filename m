From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: regression for m68k/coldfire
Date: Thu, 2 Feb 2017 23:21:09 +0300
Message-ID: <3d495020-7be2-23ba-b05f-31b323bc1a19@cogentembedded.com>
References: <20170202201500.GU11210@waldemar-brodkorb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170202201500.GU11210@waldemar-brodkorb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: linux-kernel@vger.kernel.org, gerg@uclinux.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

> Hi,
> 
> your commit 80cca775cdc4f8555612d2943a2872076b33e0ff breaks Linux
> booting in qemu-system-m68k:

Hi.

Do you compile with CONFIG_M5272?

Is f85de6666347c974cdf97b1026180995d912d7d0 also in your tree?

Nikita
