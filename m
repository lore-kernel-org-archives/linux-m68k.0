From: Goel Arpit-B44344 <B44344@freescale.com>
Subject: RE: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to
 architecture independent macro
Date: Thu, 1 Aug 2013 04:38:34 +0000
Message-ID: <0DFB48290CDB0C4680160EBE62E8F9A809E9A2E0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com>
 <1375187900-17582-3-git-send-email-B44344@freescale.com>
 <CAOZdJXW8uF_e2nQr3gAiMf4E5pvsH_S-ztAXvx9R7-nXyaZGag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOZdJXW8uF_e2nQr3gAiMf4E5pvsH_S-ztAXvx9R7-nXyaZGag@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Timur Tabi <timur@tabi.org>
Cc: "linux-m32r-ja@ml.linux-m32r.org" <linux-m32r-ja@ml.linux-m32r.org>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "takata@linux-m32r.org" <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, Stephen Warren <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-m32r@ml.linux-m32r.org" <linux-m32r@ml.linux-m32r.org>, "gregkh@linuxfoundation.org" <gregkh@linuxf>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jul 30, 2013 at 7:38 AM, Arpit Goel <B44344@freescale.com> wrote:
>
> +#ifndef spin_event_timeout
> +/**

On Thursday, August 01, 2013 5:32 AM Timur Tabi [mailto:timur@tabi.org] wrote:
> Why don't you make PowerPC also use this generic version?  It seems silly to have two virtually identical implementations of this macro?

PowerPC uses hardware timer registers provided by PowerPC architecture to implement spin_event_timeout(). These registers make
PowerPC implementation of spin_event_timeout() more granular in comparison to ones using generic USECS_PER_JIFFY framework. This
would handle those cases more granularly in which evaluation of "condition" is taking time or fails.    
